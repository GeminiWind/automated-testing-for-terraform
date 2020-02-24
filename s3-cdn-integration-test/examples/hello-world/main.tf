module "s3_static_site" {
  source        = "../../s3"
  app           = "hello-world"
	stage         = "dev"
	index_page    = "index.html"
	error_page    = "index.html"
	artifact_dir  =  "/home/haidv/go/src/automated-testing-for-terraform/s3-cdn-integration-test/test/fixture/build"
}

module "cdn" {
  source                      = "../../cloudfront"
  app                         = "hello-world"
	stage                       = "dev"
	bucket_regional_domain_name = module.s3_static_site.bucket_regional_domain_name
}

output "url" {
  value = module.cdn.domain_name
}