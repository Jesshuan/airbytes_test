metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:d92f19IKlNTRFa4U8dHzttnG1mPzfHcaZqi9hEP6B+I="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:d92f19IKlNTRFa4U8dHzttnG1mPzfHcaZqi9hEP6B+I="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:d92f19IKlNTRFa4U8dHzttnG1mPzfHcaZqi9hEP6B+I="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "9afd1b59ea73215830b17b1617a6114c7fe01da979ba5cddd629f318a8de8a7a"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:l9QQH3v/pkycZAvjGoQXOKgYW/QlxJn+WtNuG6zOFyU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:R5dhw2dQ5MmVm2/s/HTX7fOtWNppORLsh/kEp6iN89c="
  retries = 1
  verbose = false
}
