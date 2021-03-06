##########################################################################
# After installing and configuring a certificate server for your PKI, you
# should export a backup copy of the registry settings for the CA.
# This script does not do it, but you should also back up a copy of
# this folder and its contents:  $env:WinDir\System32\Certsrv\CertEnroll\
##########################################################################


# Get the number of 100-nanosecond intervals since January 1 of Year 1 (1.Jan.0001)
# and use this as a timestamp in the name of the exported file: 
$Ticks = $(Get-Date).Ticks


# Export the registry data for Certificate Services using the ticks timestamp:
reg.exe export hklm\system\CurrentControlSet\Services\CertSvc "Certificate-Services-Config-$Ticks.reg" /y




# FYI, to convert a ticks number back into a human-readable date and time,
# just pass it into Get-Date, e.g., "get-date 635589712563445855".  In a
# dir listing of many files, sort on the file name, and the name with the
# largest ticks number is the one generated most recently.  Filesystem
# timestamps can be lost as files are moved or restored from media.

