SCP Command in Linux

scp [option] [user_name@source_host:path/to/source/file] [user_name@target_host:target/path] 

Option	Description
-1	    Use protocol 1.
-2	    Use protocol 2.
-4	    Only use Ipv4 addresses.
-6	    Only use IPv6 addresses.
-B	    Run in batch mode and disable all queries for user input.
-b      [buffer_size]	Specify the buffer size used for data transfer. If not specified, uses the default 32768 bytes.
-C	    Enable compression.
-c      [cipher]	Select the cipher for data encryption. If not specified, SCP uses the default - 'AnyStdCipher'.
-D      [debug_level]	Set the debug level (1, 2, 3, or 99).
-d	    Copy the file only if the destination directory already exists.
-F      [file]	Specify an alternative configuration file for SSH.
-h	    Show a list of command options.
-i      [file]	Specify the file from which to read the identity for public key authentication.
-l      [limit]	Limit the bandwidth (specify the limit in Kbit/s).
-o      ssh_option	Set options to SSH in ssh_config format.
-P      [port]	Specify the port to which to connect. If not specified, SCP uses port 22.
-q	    Run SCP in quiet mode.
-Q	    Disable file transfer statistics.
-r	    Copy recursively.
-S      [program]	Use a specified program for encryption connection.
-u	    Delete the source file once the copy is complete.
-v	    Enable verbose mode, which sets the debug level to 2.

Examples:

Copy a File from Local to Remote Server:
scp Desktop/sample_example.txt root@136.183.142.28:/home/remote_dir

Copy File from Remote Server to Local Host:
scp 147.182.143.27:/home/remote_dir/sample_example.txt home/Desktop

Copy File from One Remote Server to Another:
scp root@147.182.143.27:/home/remote_dir/sample_example.txt sofija@146.153.129.25:home/Desktop

