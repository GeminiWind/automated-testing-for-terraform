package test

import (
	"fmt"
	"testing"
	"time"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAwsHelloWorldExample(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/hello-world",
	}
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	domainName := terraform.Output(t, terraformOptions, "url")
	url := fmt.Sprintf("http://%s", domainName)
	http_helper.HttpGetWithRetry(t, url, nil, 200, "Hello, World!", 30, 15*time.Second)
}
