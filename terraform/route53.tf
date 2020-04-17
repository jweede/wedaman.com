
resource aws_route53_zone "wedaman_com"{
  name = "wedaman.com"
}

resource "aws_route53_record" "wedaman_com" {
  zone_id = aws_route53_zone.wedaman_com.zone_id
  name = ""
  type = "A"
  alias {
    evaluate_target_health = false
    name = aws_s3_bucket.wedaman_com.website_domain
    zone_id = aws_s3_bucket.wedaman_com.hosted_zone_id
  }
}

resource "aws_route53_record" "www_wedaman_com" {
  zone_id = aws_route53_zone.wedaman_com.zone_id
  name = "www"
  type = "CNAME"
  records = [aws_s3_bucket.www_wedaman_com.website_endpoint]
  ttl = 300
}
