FROM kivy/buildozer:latest
# See https://github.com/kivy/buildozer/blob/master/Dockerfile

# Buildozer will be installed in entrypoint.sh
# This is needed to install version specified by user
RUN pip3 uninstall -y buildozer

# Remove a lot of warnings
# sudo: setrlimit(RLIMIT_CORE): Operation not permitted
# See https://github.com/sudo-project/sudo/issues/42
RUN echo "Set disable_coredump false" | sudo tee -a /etc/sudo.conf > /dev/null

COPY entrypoint.sh /action/entrypoint.sh
COPY patches.py /action/patches.py

ENTRYPOINT ["/action/entrypoint.sh"]