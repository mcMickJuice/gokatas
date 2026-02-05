package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"time"
)

const KatasFile = "katas.md"

var kata = flag.String("k", "", "completed kata")
var help = flag.Bool("h", false, "help output")

func main() {
	flag.Parse()

	if *help {
		fmt.Printf("pass -k <kataname> to update %s\n", KatasFile)
		os.Exit(0)
	}

	// take in argument of kata completed
	if *kata == "" {
		log.Fatal("-k flag not set. You need to provide a kata name")
	}

	line := fmt.Sprintf("- %s: %s\n", time.Now().Format(time.DateOnly), *kata)
	// append to file - YYYY-MM-DD: <kata file>

	file, err := os.OpenFile(KatasFile, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)

	if err != nil {
		log.Fatalf("error reading file: %v", err)
	}
	defer file.Close()
	_, err = file.Write([]byte(line))

	if err != nil {
		log.Fatalf("error writing to file: %v", err)
	}

	log.Println("file appended")
}
