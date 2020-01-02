# Fixing the ACPI error spam

When I first started installing Linux on my desktop, I noticed that as soon as I booted up the machine I would
get absolutely unreasonable amounts of dmesg spam because of kernel errors:

> [46837.460664] ACPI BIOS Error (bug): Could not resolve [\_GPE._L09.D1F0], AE_NOT_FOUND (20180531/psargs-330)
> [46837.460670] ACPI Error: Method parse/execution failed \_GPE._L09, AE_NOT_FOUND (20180531/psparse-516)
> [46837.460674] ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_L09] (20180531/evgpe-509)

And these errors completely spammed my syslog (seriously, if I left my desktop on for 24 hours I would have a ~5GB log file) which made it a pain to log into a TTY after a new install with no desktop manager/environment. It got so bad at onepoint I had a cron job running every hour just to delete syslog.

After literal years of BIOS updates, new kernels, and extremely hack-y solutions found on the internet, I think I found out how to get rid of these stupid errors once and for all. Clearly there is an issue with the Linux kernel and the BIOS/UEFI of my motherboard but I can't be fucked to go as far as to fork the kernel and figure out how to correct the patch.

### The workaround/fix

Apparently you can mask specific ACPI General Purpose Events with nothing more than a kernel parameter. So the fix was as easy as adding the following line to /etc/default/grub (or whatever bootloader configuration files you have):

`acpi_mask_gpe0x6f`

Reboot and tada! No more ACPI flooding!
