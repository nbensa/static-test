FROM debian AS builder

RUN apt update && apt install -y --no-install-recommends build-essential

COPY hello.c .

RUN gcc hello.c -static -o hello


FROM scratch

COPY --from=builder ./hello .

CMD ["./hello"]
