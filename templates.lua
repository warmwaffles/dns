function google_app(domain)
  -- Configure Google Apps mail exchangers
  mx(domain, "aspmx.l.google.com", 1)
  mx(domain, "alt1.aspmx.l.google.com", 5)
  mx(domain, "alt2.aspmx.l.google.com", 5)
  mx(domain, "aspmx2.googlemail.com", 10)
  mx(domain, "aspmx3.googlemail.com", 10)

  -- Additional Google Apps records
  cname(concat("calendar", domain), "ghs.google.com")
  cname(concat("docs", domain), "ghs.google.com")
  cname(concat("mail", domain), "ghs.google.com")
  cname(concat("sites", domain), "ghs.google.com")

  -- Configure SPF
  txt(domain, "v=spf1 a mx include:_spf.google.com ~all")
end

function heroku_app(root, app)
  -- Use alias for root domain
  -- Syntax: alias(name, target, ttl)
  alias(root, app, 300)

  -- Use a CNAME for www
  -- Syntax: cname(name, target, ttl)
  cname(concat("www", root), app)
end
