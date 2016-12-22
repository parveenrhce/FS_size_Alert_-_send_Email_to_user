# FS_size_Alert_-_send_Email_to_user
# df -h output is not correct , df -h output is wrong
This script is specially designed for those system in which "df -h" command doesn't work well or displayes the output in two lines for every filesystem. example is given below :

bash-3.2$ df -h
/plat/sun4/lib/libc_psr/libc_psr_hwcap1.so.1
                       4.9G   4.4G   467M    91%    /plat/sun/lib/libc_psr.so.1
/platform/sun4u-us3/lib/sparcv9/libc_psr/libc_psr_hwcap1.so.1
                       4.9G   4.4G   467M    91%    /plat/sun/lib/sparcv9/libc_psr.so.1


This script checks the /var FS size if it reaches to 80% and send mail to user.
