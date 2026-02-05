package main

import (
	"flag"
	"fmt"
	"log"
	"os"
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

	if *kata == "" {
		log.Fatal("-k flag not set. You need to provide a kata name")
	}
	fmt.Printf("updatekatas: %s", *kata)

	// take in argument of kata completed

	// append to file - YYYY-MM-DD: <kata file>
}
