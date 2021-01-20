# [  F E M M Y - A G E N T  ]
# Its written in python, if you understand this, you can modify it as you want.

# This variable is for setting in which IP and Port the API server will listen
# Dont be afraid to change this, its better if you change this, rather than the default
LISTEN = '0.0.0.0'
# PORT = '5050'
# KEY = ''

from femmyagent import application

if __name__ == "__main__":
    application.run(host=LISTEN)
