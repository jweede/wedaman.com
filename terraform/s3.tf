
resource "aws_s3_bucket" "wedaman_com" {
  bucket = "wedaman.com"
  acl = "public-read"

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "wedaman_com" {
  bucket = aws_s3_bucket.wedaman_com.bucket

  policy = data.aws_iam_policy_document.wedaman_com_bucket_policy.json
}

data aws_iam_policy_document wedaman_com_bucket_policy {
  statement {
    sid = "AddPerm"
    actions = ["s3:GetObject"]
    resources = ["arn:aws:s3:::wedaman.com/*"]
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
  }
  version = "2008-10-17"
}


resource "aws_s3_bucket" "www_wedaman_com" {
  bucket = "www.wedaman.com"
  acl = "public-read"

  website {
    redirect_all_requests_to = "wedaman.com"
  }
}
