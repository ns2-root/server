package main

import (
	"fmt"
	"net"
	"os"
	"os/exec"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: ", os.Args[0], "start|stop|restart|status|dns <service>")
		os.Exit(1)
	}

	command := os.Args[1]

	switch command {
	case "start":
		startService()
	case "stop":
		stopService()
	case "restart":
		restartService()
	case "status":
		checkStatus()
	case "dns":
		if len(os.Args) < 3 {
			fmt.Println("Usage: ", os.Args[0], "dns <service>")
			os.Exit(1)
		}
		service := os.Args[2]
		DNS(&service)
	default:
		fmt.Println("Invalid command. Use start, stop, restart, status, or dns <service>.")
		os.Exit(1)
	}
}

func DNS(service *string) {
	// A kaydı kontrolü yapılır, sonuç alınır
	iprecords, err := net.LookupIP(*service)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	for _, ip := range iprecords {
		fmt.Println(ip)
	}
}

func startService() {
	fmt.Println("Starting the service...")
	runCommand("service", "emk", "start")
}

func stopService() {
	fmt.Println("Stopping the service...")
	runCommand("service", "emk", "stop")
}

func restartService() {
	fmt.Println("Restarting the service...")
	runCommand("service", "emk", "restart")
}

func checkStatus() {
	fmt.Println("Checking the service status...")
	runCommand("service", "emk", "status")
}

func runCommand(command string, args ...string) {
	cmd := exec.Command(command, args...)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	err := cmd.Run()
	if err != nil {
		fmt.Println("Error:", err)
		os.Exit(1)
	}
}
