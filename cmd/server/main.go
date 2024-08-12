package main

import (
    "fmt"
    "log"
    "net"

    "google.golang.org/grpc"
    pb "path/to/your/proto/package" // Replace with the actual path to your protobuf package
)

const (
    port = ":50051"
)

type server struct {
    pb.UnimplementedYourServiceServer // Replace with your actual service server
}

func main() {
    // Start the gRPC server
    fmt.Println("Starting GoBlazer gRPC server on port", port)

    lis, err := net.Listen("tcp", port)
    if err != nil {
        log.Fatalf("Failed to listen: %v", err)
    }

    s := grpc.NewServer()
    pb.RegisterYourServiceServer(s, &server{}) // Replace with your actual service server registration

    if err := s.Serve(lis); err != nil {
        log.Fatalf("Failed to serve: %v", err)
    }
}
