$root = "C:\Users\lilos\OneDrive\Documents\agence-silence"
$prefix = "http://localhost:8791/"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
$listener.Start()
Write-Host "Serving $root at $prefix"

$mime = @{
  ".html" = "text/html; charset=utf-8"
  ".css"  = "text/css; charset=utf-8"
  ".js"   = "application/javascript; charset=utf-8"
  ".svg"  = "image/svg+xml"
  ".png"  = "image/png"
  ".jpg"  = "image/jpeg"
  ".jpeg" = "image/jpeg"
  ".webp" = "image/webp"
  ".ico"  = "image/x-icon"
  ".xml"  = "application/xml; charset=utf-8"
  ".txt"  = "text/plain; charset=utf-8"
  ".toml" = "text/plain; charset=utf-8"
  ".md"   = "text/plain; charset=utf-8"
}

while ($listener.IsListening) {
  try {
    $ctx = $listener.GetContext()
    $rel = [System.Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath)

    if ($rel -eq "/__stop") { $ctx.Response.Close(); break }

    # --- Endpoint d'ecriture : POST /__save?name=chemin/relatif.png ---------
    # Sert uniquement a recuperer sur le disque les fichiers generes en Canvas
    # par le navigateur. Strictement local.
    if ($rel -eq "/__save" -and $ctx.Request.HttpMethod -eq "POST") {
      $name = $ctx.Request.QueryString["name"]
      $ok = $false
      if ($name -and $name -notmatch '\.\.' -and $name -notmatch '^[/\\]' -and $name -notmatch ':') {
        $out = Join-Path $root ($name -replace "/", "\")
        $dir = Split-Path $out -Parent
        if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
        $ms = New-Object System.IO.MemoryStream
        $ctx.Request.InputStream.CopyTo($ms)
        [System.IO.File]::WriteAllBytes($out, $ms.ToArray())
        $ms.Dispose()
        Write-Host ("saved {0}" -f $name)
        $ok = $true
      }
      $body = [System.Text.Encoding]::UTF8.GetBytes($(if ($ok) { "OK" } else { "REFUSE" }))
      $ctx.Response.StatusCode = $(if ($ok) { 200 } else { 400 })
      $ctx.Response.ContentType = "text/plain"
      $ctx.Response.AddHeader("Access-Control-Allow-Origin", "*")
      $ctx.Response.OutputStream.Write($body, 0, $body.Length)
      $ctx.Response.Close()
      continue
    }

    $path = Join-Path $root ($rel.TrimStart("/") -replace "/", "\")
    if ((Test-Path $path -PathType Container) -or $rel.EndsWith("/") -or $rel -eq "") {
      $path = Join-Path $path "index.html"
    }
    if (Test-Path $path -PathType Leaf) {
      $ext = [System.IO.Path]::GetExtension($path).ToLower()
      $ct = $mime[$ext]; if (-not $ct) { $ct = "application/octet-stream" }
      $bytes = [System.IO.File]::ReadAllBytes($path)
      $ctx.Response.ContentType = $ct
      $ctx.Response.StatusCode = 200
      $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    } else {
      $err = Join-Path $root "404.html"
      $bytes = [System.IO.File]::ReadAllBytes($err)
      $ctx.Response.ContentType = "text/html; charset=utf-8"
      $ctx.Response.StatusCode = 404
      $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    }
    $ctx.Response.Close()
  } catch { }
}
$listener.Stop()
