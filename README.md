# Automated testing Terraform example

## Prerequisites

Before you begin, install the following software:
- __Go programming language__: Terraform test cases are written in [Go](https://golang.org/dl/)
- __dep__: [dep](https://github.com/golang/dep#installation) is a dependency management tool for Go
- AWS CLI: The AWS CLi is a command-line tool you can use to manage AWS resources

## Getting started

Clone this repo to your `GOPATH/src`. To get `GOPATH`, you can run `go env`

```bash
  cd GOPATH/src
  git clone https://github.com/GeminiWind/automated-testing-for-terraform/tree/master/ec2-unit-test
```


### Install dependencies

To install Go dependencies, run the following command

```bash
dep init
```

### Run unit test example

To run the unit test example, complete the following steps on the command line

```bash
cd ec2-unit-test
cd test
go test -v ec2_unit_test.go
```

### Run integrati test example

To run the unit test example, complete the following steps on the command line

```bash
cd s3-cdn-integration-test
cd test
go test -v s3_cloudfront_integration_test.go
```