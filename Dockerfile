FROM nacyot/pascal-fp_compiler:apt as devel

WORKDIR /root
COPY ./hello_world.pas ./
RUN pc -v hello_world.pas 

FROM ubuntu:bionic as release
COPY --from=devel /root/hello_world /root

CMD ["/root/hello_world"]
