# Use the base CentOS image.  If systemd is required in the future, change to 'creativeux/centos-base-systemd'
FROM centos:7

MAINTAINER Adrian Jagnanan 

# Install the EPEL repository
RUN yum -y install \
  epel-release

# Install core RPMs
RUN yum -y install \
  tar \
  bzip2

# Install required developer tools
RUN yum -y install \
  make \
  gcc \
  git

# Install node & npm and upgrade to desired versions.
RUN yum -y install \
  nodejs \
  npm && \
  npm install -g n && \
  n lts && \
  npm install -g npm

# Install ruby
RUN yum -y install ruby \
  ruby-devel \
  rubygems

# Install compass
RUN gem install compass

# Install required libs
RUN yum -y install \
  libpng-devel

# Install Grunt and Bower
RUN npm install -g \
  grunt-cli \
  bower \
  serverless && \
  echo '{ "allow_root": true }' > /root/.bowerrc

# Clean up
RUN yum clean all && \
  npm cache clean -f

# Define working directory.
WORKDIR /data

# Define default command
CMD ["bash"]
