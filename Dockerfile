# Baseline system
FROM ubuntu:20.04
RUN yes | unminimize
RUN DEBIAN_FRONTEND=noninteractive apt install -y man binutils nano vim gcc ssh python python3 gcc-multilib gdb
RUN systemctl enable ssh
RUN echo "PS1='[ \u@\w ] $ '">>/etc/bash.bashrc
RUN chmod 1733 /tmp


# User and group structure
RUN groupadd chaos
RUN useradd -G chaos -mk /dev/null -s /bin/bash chaos0
RUN useradd -G chaos -mk /dev/null -s /bin/bash chaos1
RUN useradd -G chaos -mk /dev/null -s /bin/bash chaos2
RUN useradd -G chaos -mk /dev/null -s /bin/bash chaos3
RUN useradd -G chaos -mk /dev/null -s /bin/bash chaos4
RUN useradd -G chaos -mk /dev/null -s /bin/bash chaos5
RUN echo 'chaos0:chaos0' | chpasswd
RUN echo 'chaos1:sm0l-sec' | chpasswd
RUN echo 'chaos2:0xFA57' | chpasswd
RUN echo 'chaos3:N0T-AN-0VERFL0W' | chpasswd
RUN echo 'chaos4:symbolicEXPLOIT' | chpasswd
RUN echo 'chaos5:CHA0Sund3rC0NTR0L' | chpasswd


# Install files
COPY --chown=chaos0 levels/chaos0 /home/chaos0
ADD --chown=chaos0 chaos_pass/chaos0 /etc/chaos_pass/chaos0

COPY --chown=chaos1 levels/chaos1 /home/chaos1
ADD --chown=chaos1:chaos2 chaos_pass/chaos1 /etc/chaos_pass/chaos1

COPY --chown=chaos2 levels/chaos2 /home/chaos2
ADD --chown=chaos2 chaos_pass/chaos2 /etc/chaos_pass/chaos2

COPY --chown=chaos3 levels/chaos3 /home/chaos3
ADD --chown=chaos3 chaos_pass/chaos3 /etc/chaos_pass/chaos3

COPY --chown=chaos4 levels/chaos4 /home/chaos4
ADD --chown=chaos4 chaos_pass/chaos4 /etc/chaos_pass/chaos4

COPY --chown=chaos5 levels/chaos5 /home/chaos5
ADD --chown=chaos5 chaos_pass/chaos5 /etc/chaos_pass/chaos5

RUN chmod -R 550 /home/* /etc/chaos_pass
RUN chown root:chaos /etc/chaos_pass
RUN chmod 550 /etc/chaos_pass


# Compile binaries
RUN gcc -o /home/chaos0/chaos0 /home/chaos0/chaos0.c -m32 -fno-stack-protector -Wl,-z,norelro -no-pie
RUN gcc -o /home/chaos1/chaos1 /home/chaos1/chaos1.c -m32 -fno-stack-protector -Wl,-z,norelro -no-pie
RUN gcc -o /home/chaos2/chaos2 /home/chaos2/chaos2.c -m32 -fno-stack-protector -Wl,-z,norelro -no-pie
RUN gcc -o /home/chaos3/chaos3 /home/chaos3/chaos3.c -m32 -fno-stack-protector -Wl,-z,norelro -no-pie
RUN gcc -o /home/chaos4/chaos4 /home/chaos4/chaos4.c -m32 -fno-stack-protector -Wl,-z,norelro -no-pie


# Fix permissions
RUN chown chaos1 /home/chaos0/chaos0
RUN chmod 4555 /home/chaos0/chaos0

RUN chown chaos2:chaos2 /home/chaos1/chaos1
RUN chmod 6555 /home/chaos1/chaos1

RUN chown chaos3 /home/chaos2/chaos2
RUN chmod 4555 /home/chaos2/chaos2

RUN chown chaos4 /home/chaos3/chaos3
RUN chmod 4555 /home/chaos3/chaos3

RUN chown chaos5 /home/chaos4/chaos4
RUN chmod 4555 /home/chaos4/chaos4

# Expose SSH
EXPOSE 22
RUN mkdir /var/run/sshd
CMD /usr/sbin/sshd -D

# Always run
ADD https://www.trapkit.de/tools/checksec.sh / /usr/bin/
RUN chmod 555 /usr/bin/checksec.sh
RUN ln -s /usr/bin/checksec.sh /usr/bin/checksec