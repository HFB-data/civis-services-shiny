FROM civisanalytics/datascience-r:4.0.2

RUN apt-get update && apt-get install -y \
    git

COPY ./requirements.txt /requirements.txt
RUN Rscript -e "packages <- readLines('/requirements.txt'); install.packages(packages)"
RUN Rscript -e "devtools::install_github('juba/rmdformats')"

# COPY ./report.Rmd /
COPY entrypoint.sh /

EXPOSE 3838

ENTRYPOINT ["/entrypoint.sh"]
