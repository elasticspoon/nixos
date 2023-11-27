{ pkgs, ... }: {
  home.file = { };

  home.packages = with pkgs; [
    gofumpt
    goimports-reviser

    # protobufs
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc

    air # hot reload for go
  ];

  programs.go = {
    enable = true;
    packages = { };
  };
}
