#!/usr/bin/env python3
import subprocess
import json

try:
    result = subprocess.run(['playerctl', 'metadata', '--format', '{"text": "{{artist}} - {{title}}", "tooltip": "{{playerName}}: {{artist}} - {{title}}", "alt": "{{status}}", "class": "{{status}}"}'], 
                          capture_output=True, text=True, timeout=5)
    if result.returncode == 0:
        print(result.stdout.strip())
    else:
        print('{"text": "", "tooltip": "No media", "alt": "stopped", "class": "stopped"}')
except:
    print('{"text": "", "tooltip": "No media", "alt": "stopped", "class": "stopped"}')
