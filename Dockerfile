FROM jasimioni/catalyst:latest

# Copy our source file into the container
COPY Hello /Hello

# Set permissions to the /go folder (for OpenShift)
RUN chgrp -R 0 /Hello && chmod -R g+rwX /Hello

# Just documentation.
# This container needs Docker or OpenShift to help with networking
EXPOSE 3000

# OpenShift picks up this label and creates a service
LABEL io.openshift.expose-services 3000/http

# OpenShift uses root group instead of root user
USER 1001

# Command to run when container starts up
CMD /Hello/script/hello_server.pl

