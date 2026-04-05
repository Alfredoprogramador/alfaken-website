# 🔍 Script de Depuração - Alfaken Startup
# Execute este script no PowerShell para verificar o projeto

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  ALFAKEN STARTUP - DEBUG SCRIPT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar arquivos essenciais
Write-Host "📋 Verificando arquivos essenciais..." -ForegroundColor Yellow
$files = @("index.html", "styles.css", "script.js", "README.md", ".gitignore")
$allFilesExist = $true

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "  ✅ $file encontrado" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $file NÃO encontrado!" -ForegroundColor Red
        $allFilesExist = $false
    }
}

Write-Host ""

# Verificar tamanho dos arquivos
Write-Host "📊 Tamanho dos arquivos:" -ForegroundColor Yellow
foreach ($file in $files) {
    if (Test-Path $file) {
        $size = (Get-Item $file).Length
        $sizeKB = [math]::Round($size / 1KB, 2)
        Write-Host "  📄 $file - $sizeKB KB" -ForegroundColor Cyan
    }
}

Write-Host ""

# Verificar se Git está inicializado
Write-Host "🔧 Verificando Git..." -ForegroundColor Yellow
if (Test-Path ".git") {
    Write-Host "  ✅ Repositório Git inicializado" -ForegroundColor Green
    
    # Verificar status
    $gitStatus = git status --short 2>$null
    if ($gitStatus) {
        Write-Host "  📝 Arquivos modificados encontrados" -ForegroundColor Cyan
        Write-Host $gitStatus -ForegroundColor Gray
    } else {
        Write-Host "  ✅ Nenhuma modificação pendente" -ForegroundColor Green
    }
} else {
    Write-Host "  ⚠️  Git não inicializado" -ForegroundColor Yellow
    Write-Host "  💡 Execute: git init" -ForegroundColor Cyan
}

Write-Host ""

# Validar HTML (verificação básica)
Write-Host "🌐 Validando HTML..." -ForegroundColor Yellow
if (Test-Path "index.html") {
    $htmlContent = Get-Content "index.html" -Raw
    
    # Verificações básicas
    $checks = @{
        "<!DOCTYPE html>" = "Declaração DOCTYPE"
        "<html lang=" = "Atributo de idioma"
        "<meta charset=" = "Charset definido"
        "<meta name=`"viewport`"" = "Meta viewport (responsivo)"
        "<title>" = "Tag title presente"
        "styles.css" = "CSS linkado"
        "script.js" = "JavaScript linkado"
    }
    
    foreach ($check in $checks.GetEnumerator()) {
        if ($htmlContent -like "*$($check.Key)*") {
            Write-Host "  ✅ $($check.Value)" -ForegroundColor Green
        } else {
            Write-Host "  ❌ $($check.Value) não encontrado!" -ForegroundColor Red
        }
    }
}

Write-Host ""

# Validar CSS (verificação básica)
Write-Host "🎨 Validando CSS..." -ForegroundColor Yellow
if (Test-Path "styles.css") {
    $cssContent = Get-Content "styles.css" -Raw
    
    $cssChecks = @{
        ":root" = "Variáveis CSS definidas"
        "@media" = "Media queries (responsivo)"
        "grid" = "CSS Grid usado"
        "flex" = "Flexbox usado"
        "transition" = "Transições adicionadas"
    }
    
    foreach ($check in $cssChecks.GetEnumerator()) {
        if ($cssContent -like "*$($check.Key)*") {
            Write-Host "  ✅ $($check.Value)" -ForegroundColor Green
        } else {
            Write-Host "  ⚠️  $($check.Value) não encontrado" -ForegroundColor Yellow
        }
    }
}

Write-Host ""

# Validar JavaScript (verificação básica)
Write-Host "⚙️  Validando JavaScript..." -ForegroundColor Yellow
if (Test-Path "script.js") {
    $jsContent = Get-Content "script.js" -Raw
    
    $jsChecks = @{
        "addEventListener" = "Event listeners configurados"
        "querySelector" = "DOM manipulation presente"
        "forEach" = "Loops implementados"
        "classList" = "Classes dinâmicas"
    }
    
    foreach ($check in $jsChecks.GetEnumerator()) {
        if ($jsContent -like "*$($check.Key)*") {
            Write-Host "  ✅ $($check.Value)" -ForegroundColor Green
        } else {
            Write-Host "  ⚠️  $($check.Value) não encontrado" -ForegroundColor Yellow
        }
    }
}

Write-Host ""

# Verificar dependências externas
Write-Host "🌍 Verificando recursos externos..." -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" -Method Head -TimeoutSec 5 -ErrorAction SilentlyContinue
    if ($response.StatusCode -eq 200) {
        Write-Host "  ✅ Font Awesome CDN acessível" -ForegroundColor Green
    }
} catch {
    Write-Host "  ⚠️  Não foi possível verificar Font Awesome CDN" -ForegroundColor Yellow
}

Write-Host ""

# Sugestões
Write-Host "💡 SUGESTÕES DE MELHORIAS:" -ForegroundColor Cyan
Write-Host "  1. Adicionar favicon.ico" -ForegroundColor White
Write-Host "  2. Integrar formulário com EmailJS ou backend" -ForegroundColor White
Write-Host "  3. Adicionar Google Analytics" -ForegroundColor White
Write-Host "  4. Otimizar para SEO (meta tags)" -ForegroundColor White
Write-Host "  5. Adicionar imagens reais dos projetos" -ForegroundColor White

Write-Host ""

# Instruções de deploy
Write-Host "🚀 PRÓXIMOS PASSOS PARA DEPLOY:" -ForegroundColor Cyan
Write-Host "  1. git init" -ForegroundColor Yellow
Write-Host "  2. git add ." -ForegroundColor Yellow
Write-Host "  3. git commit -m 'Initial commit'" -ForegroundColor Yellow
Write-Host "  4. Criar repositório no GitHub" -ForegroundColor Yellow
Write-Host "  5. git remote add origin URL_DO_REPOSITORIO" -ForegroundColor Yellow
Write-Host "  6. git push -u origin main" -ForegroundColor Yellow
Write-Host "  7. Ativar GitHub Pages em Settings → Pages" -ForegroundColor Yellow

Write-Host ""

# Testar abertura no navegador
Write-Host "🌐 Deseja abrir o site no navegador? (S/N): " -ForegroundColor Cyan -NoNewline
$response = Read-Host

if ($response -eq "S" -or $response -eq "s") {
    if (Test-Path "index.html") {
        Write-Host "  🚀 Abrindo index.html no navegador..." -ForegroundColor Green
        Start-Process "index.html"
        
        Start-Sleep -Seconds 1
        
        Write-Host "  🔍 Abrindo página de debug..." -ForegroundColor Green
        if (Test-Path "debug-test.html") {
            Start-Process "debug-test.html"
        }
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  ✅ DEPURAÇÃO CONCLUÍDA!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
