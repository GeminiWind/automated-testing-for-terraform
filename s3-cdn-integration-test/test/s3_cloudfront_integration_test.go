package test

import (
	"testing"
	"time"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAwsHelloWorldExample(t *testing.T) {
	s3TerraformOpts := &terraform.Options{
		TerraformDir: "../s3",
		Vars: map[string]interface{}{
			"app":          "hello-world",
			"stage":        "dev",
			"index_page":   "index.html",
			"error_page":   "index.html",
			"artifact_dir": "/home/haidv/go/src/automated-testing-for-terraform/s3-cdn-integration-test/test/fixture/build", //FIXME: please resolve the path to build folder
		},
	}
	defer terraform.Destroy(t, s3TerraformOpts)
	terraform.InitAndApply(t, s3TerraformOpts)

	bucketRegionalDomainName := terraform.Output(t, s3TerraformOpts, "bucket_regional_domain_name")

	cdnTerraformOpts := &terraform.Options{
		TerraformDir: "../cloudfront",
		Vars: map[string]interface{}{
			"app":                         "hello-world",
			"stage":                       "dev",
			"bucket_regional_domain_name": bucketRegionalDomainName,
		},
	}
	defer terraform.Destroy(t, cdnTerraformOpts)
	terraform.InitAndApply(t, cdnTerraformOpts)

	url := terraform.Output(t, cdnTerraformOpts, "domain_name")
	http_helper.HttpGetWithRetry(t, url, nil, 200, "Hello, World!", 30, 15*time.Second)
}
