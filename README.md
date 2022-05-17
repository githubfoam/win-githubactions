# win-githubactions

[![latest osquery CI workflow](https://github.com/githubfoam/win-githubactions/actions/workflows/latest-osquery-wf.yml/badge.svg)](https://github.com/githubfoam/win-githubactions/actions/workflows/latest-osquery-wf.yml)  

[![2022 osquery CI workflow](https://github.com/githubfoam/win-githubactions/actions/workflows/2022-osquery-wf.yml/badge.svg)](https://github.com/githubfoam/win-githubactions/actions/workflows/2022-osquery-wf.yml)  
[![2019 osquery CI workflow](https://github.com/githubfoam/win-githubactions/actions/workflows/2019-osquery-wf.yml/badge.svg)](https://github.com/githubfoam/win-githubactions/actions/workflows/2019-osquery-wf.yml)  
[![2016 osquery CI workflow](https://github.com/githubfoam/win-githubactions/actions/workflows/2016-osquery-wf.yml/badge.svg)](https://github.com/githubfoam/win-githubactions/actions/workflows/2016-osquery-wf.yml)  

~~~~
Check the processes that have a deleted executable
SELECT * FROM processes WHERE on_disk = 0;

Get the process name, port, and PID, for processes listening on all interfaces:
SELECT DISTINCT processes.name, listening_ports.port, processes.pid
  FROM listening_ports JOIN processes USING (pid)
  WHERE listening_ports.address = '0.0.0.0';

Find every macOS LaunchDaemon that launches an executable and keeps it running:
SELECT name, program || program_arguments AS executable
  FROM launchd
  WHERE (run_at_load = 1 AND keep_alive = 1)
  AND (program != '' OR program_arguments != '');

Check for ARP anomalies from the host's perspective:    
SELECT address, mac, COUNT(mac) AS mac_count
  FROM arp_cache GROUP BY mac
  HAVING count(mac) > 1;

Alternatively, Check for ARP anomalies from the host's perspective:
  SELECT address, mac, mac_count
    FROM
      (SELECT address, mac, COUNT(mac) AS mac_count FROM arp_cache GROUP BY mac)
    WHERE mac_count > 1;

    osquery> .all firefox_addons;
    osquery> .all  chrome_extensions;

~~~~
~~~~
macos_osquery 
https://gist.github.com/githubfoam/6753b5efad8e5ab8fa2ca29ce7b29988
windows_osquery 
https://gist.github.com/githubfoam/afeb4fbbee731c427d645382e59b7948
linux_osquery 
https://gist.github.com/githubfoam/0babb95da5845b8d4ee41f5711de637a
~~~~

~~~~
predefined tables
<https://osquery.io/schema/4.1.1>

# https://osquery.readthedocs.io/en/stable/installation/install-linux/

https://github.com/google/santa
https://github.com/groob/moroz
https://github.com/zentralopensource/zentral

https://github.com/actions/virtual-environments

~~~~