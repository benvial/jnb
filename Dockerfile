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

# Install Python dependencies for the Python visualization and tutorial notebooks

RUN pip install -r requirements.txt

RUN chown -R ${USER} ${HOME} && \
    chmod +x ${HOME}/tutorials/*.sh
    
USER ${USER}

# Pre-exec notebooks to improve first-use start time
WORKDIR ${HOME}/tutorials
RUN ./prebuild.sh
