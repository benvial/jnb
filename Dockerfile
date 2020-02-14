# We use the iqsharp-base image, as that includes
# the .NET Core SDK, IQ#, and Jupyter Notebook already
# installed for us.
FROM mcr.microsoft.com/quantum/iqsharp-base:0.10.1911.1607

# Add metadata indicating that this image is used for the QC book samples.
ENV IQSHARP_HOSTING_ENV=CODE_TUTORIALS

# Make sure the contents of our repo are in ${HOME}
# Required for mybinder.org
COPY . ${HOME}
USER root
RUN chown -R ${USER} ${HOME} && \
    chmod +x ${HOME}/tutorials/*.sh
USER ${USER}

RUN pip install --user --no-cache-dir RISE


# Pre-exec notebooks to improve first-use start time
WORKDIR ${HOME}/tutorials
RUN ./prebuild.sh
