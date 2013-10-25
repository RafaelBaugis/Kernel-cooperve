/*
 * BaCeM-tweak is small kernel module to enable UV on Samsung Galaxy Y.
 *
 * Copyright (c) 2012 Irfan Bagus. All rights reserved.
 * Written by Irfan Bagus (irfanbagus@gmail.com)
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/kallsyms.h>
#include <linux/cpufreq.h>
#include <linux/err.h>
#include <linux/regulator/consumer.h>
#include <plat/bcm_cpufreq_drv.h>
#include <linux/sysctl.h>
#include <asm/uaccess.h>

static struct cpufreq_frequency_table *cpufreq_fix_table = NULL;

static void fix_freq_table(void) {
	struct bcm_cpu_info *cpu_info;
	struct cpufreq_policy *policy;
	int i;

	/* table */
	if (!cpufreq_frequency_get_table(0)) {
		cpu_info = (struct bcm_cpu_info*)kallsyms_lookup_name(
				"bcm215xx_cpu_info");
		if (cpu_info) {
			cpufreq_fix_table = kmalloc(sizeof(struct cpufreq_frequency_table)*
				(cpu_info[0].num_freqs+1),GFP_KERNEL);
			for (i=0;i<cpu_info[0].num_freqs;i++) {
				cpufreq_fix_table[i].index = i;
				cpufreq_fix_table[i].frequency =
					cpu_info[0].freq_tbl[i].cpu_freq*1000;
			}
			i = cpu_info[0].num_freqs;
			cpufreq_fix_table[i].index = i;
			cpufreq_fix_table[i].frequency = CPUFREQ_TABLE_END;
			cpufreq_frequency_table_get_attr(cpufreq_fix_table,0);
		}
	}

	/* latency */
	policy = cpufreq_cpu_get(0);
	if (policy) {
		if (policy->cpuinfo.transition_latency > 10000000)
			policy->cpuinfo.transition_latency = 1000000;
		cpufreq_cpu_put(policy);
	}
}

static int __init bacem_tweak_init(void)
{
	fix_freq_table();
	return 0;
}

static void __exit bacem_tweak_exit(void)
{
	if (cpufreq_fix_table) {
		cpufreq_frequency_table_put_attr(0);
		kfree(cpufreq_fix_table);
	}
}

module_init(bacem_tweak_init);
module_exit(bacem_tweak_exit);

MODULE_LICENSE("GPL");



