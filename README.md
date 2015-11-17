Docker templating entrypoint
============================

A Docker entrypoint script that renders templates using environment variables
before starting the main application.


## Building

    pip install -r requirements.txt
    python setup.py build

The application is available at `dist/entrypoint`.


## Usage

An example Dockerfile:

    FROM nginx

    COPY nginx.conf /templates/etc/nginx/nginx.conf
    COPY dist/entrypoint /usr/local/bin/entrypoint

    ENTRYPOINT ["entrypoint", "/templates", "/"]

    RUN ["nginx", "-g", "daemon off;"]

When you run the container, all environment variables will be available in the
`nginx.conf` template.
