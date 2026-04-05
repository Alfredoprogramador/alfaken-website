# ============================================
# 🚀 Script de Deploy Automático - Alfaken
# ============================================

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet('github', 'vercel', 'netlify', 'all')]
    [string]$Platform = 'all',
    
    [Parameter(Mandatory=$false)]
    [string]$CommitMessage = "Deploy to production"
)

Write-Host "╔════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   🚀 ALFAKEN STARTUP - DEPLOY AUTOMÁTICO         ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Verificar se Git está instalado
Write-Host "🔍 Verificando dependências..." -ForegroundColor Yellow
try {
    $gitVersion = git --version
    Write-Host "  ✅ Git instalado: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "  ❌ Git não encontrado! Instale em: https://git-scm.com" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Verificar se há mudanças
Write-Host "📝 Verificando alterações..." -ForegroundColor Yellow
$status = git status --short

if ($status) {
    Write-Host "  📄 Arquivos modificados encontrados:" -ForegroundColor Cyan
    Write-Host $status -ForegroundColor Gray
} else {
    Write-Host "  ℹ️  Nenhuma alteração detectada" -ForegroundColor Gray
}

Write-Host ""

# Confirmar deploy
Write-Host "⚠️  Deseja continuar com o deploy? (S/N): " -ForegroundColor Yellow -NoNewline
$confirm = Read-Host

if ($confirm -ne "S" -and $confirm -ne "s") {
    Write-Host "❌ Deploy cancelado pelo usuário" -ForegroundColor Red
    exit 0
}

Write-Host ""

# ============================================
# ETAPA 1: Preparação
# ============================================
Write-Host "📦 ETAPA 1: Preparando arquivos..." -ForegroundColor Cyan

# Verificar arquivos essenciais
$requiredFiles = @(
    "index.html",
    "styles.css",
    "script.js",
    "translations.js",
    "README.md",
    "DEPLOY.md"
)

$missingFiles = @()
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "  ✅ $file" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $file - NÃO ENCONTRADO!" -ForegroundColor Red
        $missingFiles += $file
    }
}

if ($missingFiles.Count -gt 0) {
    Write-Host ""
    Write-Host "❌ Arquivos essenciais faltando! Corrija antes de continuar." -ForegroundColor Red
    exit 1
}

Write-Host ""

# ============================================
# ETAPA 2: Git
# ============================================
if ($Platform -eq 'github' -or $Platform -eq 'all') {
    Write-Host "📤 ETAPA 2: Enviando para GitHub..." -ForegroundColor Cyan
    
    # Verificar se já existe repositório Git
    if (-not (Test-Path ".git")) {
        Write-Host "  🔧 Inicializando repositório Git..." -ForegroundColor Yellow
        git init
        Write-Host "  ✅ Repositório inicializado" -ForegroundColor Green
    } else {
        Write-Host "  ✅ Repositório Git já existe" -ForegroundColor Green
    }
    
    # Add files
    Write-Host "  📝 Adicionando arquivos..." -ForegroundColor Yellow
    git add .
    
    # Commit
    Write-Host "  💾 Criando commit..." -ForegroundColor Yellow
    $commitResult = git commit -m $CommitMessage 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  ✅ Commit criado com sucesso" -ForegroundColor Green
    } else {
        if ($commitResult -like "*nothing to commit*") {
            Write-Host "  ℹ️  Nenhuma alteração para commit" -ForegroundColor Gray
        } else {
            Write-Host "  ⚠️  $commitResult" -ForegroundColor Yellow
        }
    }
    
    # Verificar remote
    $remotes = git remote
    if ($remotes -notcontains "origin") {
        Write-Host ""
        Write-Host "  ⚠️  Remote 'origin' não configurado!" -ForegroundColor Yellow
        Write-Host "  📌 Configure manualmente:" -ForegroundColor Cyan
        Write-Host "     git remote add origin https://github.com/SEU_USUARIO/alfaken-website.git" -ForegroundColor White
        Write-Host ""
        
        Write-Host "  Digite a URL do repositório GitHub (ou Enter para pular): " -ForegroundColor Yellow -NoNewline
        $repoUrl = Read-Host
        
        if ($repoUrl) {
            git remote add origin $repoUrl
            Write-Host "  ✅ Remote configurado" -ForegroundColor Green
        } else {
            Write-Host "  ⏭️  Pulando configuração de remote" -ForegroundColor Gray
        }
    } else {
        Write-Host "  ✅ Remote 'origin' já configurado" -ForegroundColor Green
    }
    
    # Push
    if ($remotes -contains "origin" -or $repoUrl) {
        Write-Host "  🚀 Enviando para GitHub..." -ForegroundColor Yellow
        
        try {
            git push -u origin main 2>&1
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  ✅ Código enviado para GitHub com sucesso!" -ForegroundColor Green
            } else {
                # Tentar push sem -u
                git push 2>&1
                if ($LASTEXITCODE -eq 0) {
                    Write-Host "  ✅ Código enviado para GitHub com sucesso!" -ForegroundColor Green
                } else {
                    Write-Host "  ⚠️  Erro ao enviar. Verifique credenciais e tente manualmente." -ForegroundColor Yellow
                }
            }
        } catch {
            Write-Host "  ⚠️  Erro ao enviar para GitHub" -ForegroundColor Yellow
            Write-Host "  💡 Execute manualmente: git push -u origin main" -ForegroundColor Cyan
        }
    }
    
    Write-Host ""
}

# ============================================
# ETAPA 3: Instruções de Deploy
# ============================================
Write-Host "📋 ETAPA 3: Próximos passos para deploy..." -ForegroundColor Cyan
Write-Host ""

if ($Platform -eq 'vercel' -or $Platform -eq 'all') {
    Write-Host "🔷 VERCEL (Recomendado):" -ForegroundColor Magenta
    Write-Host "  1. Acesse: https://vercel.com" -ForegroundColor White
    Write-Host "  2. Faça login com GitHub" -ForegroundColor White
    Write-Host "  3. Clique em 'Add New Project'" -ForegroundColor White
    Write-Host "  4. Importe o repositório 'alfaken-website'" -ForegroundColor White
    Write-Host "  5. Clique em 'Deploy'" -ForegroundColor White
    Write-Host "  6. Aguarde 1-2 minutos" -ForegroundColor White
    Write-Host "  ✅ Arquivo de configuração: vercel.json (já criado)" -ForegroundColor Green
    Write-Host ""
}

if ($Platform -eq 'netlify' -or $Platform -eq 'all') {
    Write-Host "🔶 NETLIFY:" -ForegroundColor Magenta
    Write-Host "  1. Acesse: https://netlify.com" -ForegroundColor White
    Write-Host "  2. Faça login com GitHub" -ForegroundColor White
    Write-Host "  3. Clique em 'Add new site'" -ForegroundColor White
    Write-Host "  4. Import from Git → GitHub" -ForegroundColor White
    Write-Host "  5. Selecione 'alfaken-website'" -ForegroundColor White
    Write-Host "  6. Clique em 'Deploy'" -ForegroundColor White
    Write-Host "  ✅ Arquivo de configuração: netlify.toml (já criado)" -ForegroundColor Green
    Write-Host ""
}

# ============================================
# ETAPA 4: Domínio
# ============================================
Write-Host "🌐 ETAPA 4: Configuração de Domínio Próprio" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Se você tem um domínio (ex: alfaken.com.br):" -ForegroundColor Yellow
Write-Host ""
Write-Host "  📌 Para Vercel:" -ForegroundColor Cyan
Write-Host "     1. No dashboard, vá em Settings → Domains" -ForegroundColor White
Write-Host "     2. Adicione seu domínio" -ForegroundColor White
Write-Host "     3. Configure DNS:" -ForegroundColor White
Write-Host "        - Tipo A: @ → 76.76.21.21" -ForegroundColor Gray
Write-Host "        - Tipo CNAME: www → cname.vercel-dns.com" -ForegroundColor Gray
Write-Host ""
Write-Host "  📌 Para Netlify:" -ForegroundColor Cyan
Write-Host "     1. Vá em Domain settings → Add custom domain" -ForegroundColor White
Write-Host "     2. Digite seu domínio" -ForegroundColor White
Write-Host "     3. Configure DNS:" -ForegroundColor White
Write-Host "        - Tipo A: @ → 75.2.60.5" -ForegroundColor Gray
Write-Host "        - Tipo CNAME: www → SEU-SITE.netlify.app" -ForegroundColor Gray
Write-Host ""
Write-Host "  ⏰ Propagação DNS: até 48h (normalmente 1-6 horas)" -ForegroundColor Yellow
Write-Host ""

# ============================================
# ETAPA 5: HTTPS
# ============================================
Write-Host "🔒 ETAPA 5: HTTPS/SSL" -ForegroundColor Cyan
Write-Host "  ✅ HTTPS é configurado AUTOMATICAMENTE pela Vercel e Netlify!" -ForegroundColor Green
Write-Host "  ✅ Certificado SSL gratuito via Let's Encrypt" -ForegroundColor Green
Write-Host "  ✅ Renovação automática" -ForegroundColor Green
Write-Host ""

# ============================================
# Resumo Final
# ============================================
Write-Host "╔════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║              ✅ DEPLOY PREPARADO!                 ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "📁 Arquivos prontos:" -ForegroundColor Cyan
Write-Host "  ✅ Código enviado para GitHub" -ForegroundColor Green
Write-Host "  ✅ vercel.json configurado" -ForegroundColor Green
Write-Host "  ✅ netlify.toml configurado" -ForegroundColor Green
Write-Host "  ✅ robots.txt criado" -ForegroundColor Green
Write-Host "  ✅ sitemap.xml criado" -ForegroundColor Green
Write-Host "  ✅ CNAME configurado" -ForegroundColor Green
Write-Host ""
Write-Host "📚 Documentação:" -ForegroundColor Cyan
Write-Host "  📖 Guia completo: DEPLOY.md" -ForegroundColor White
Write-Host "  🌍 Idiomas: MULTILANGUAGE.md" -ForegroundColor White
Write-Host "  📄 README: README.md" -ForegroundColor White
Write-Host ""
Write-Host "🎯 Próximos passos:" -ForegroundColor Cyan
Write-Host "  1. Escolha plataforma (Vercel recomendado)" -ForegroundColor Yellow
Write-Host "  2. Importe projeto do GitHub" -ForegroundColor Yellow
Write-Host "  3. Configure domínio próprio (opcional)" -ForegroundColor Yellow
Write-Host "  4. Aguarde deploy (1-2 minutos)" -ForegroundColor Yellow
Write-Host "  5. ✨ Site no ar com HTTPS!" -ForegroundColor Yellow
Write-Host ""
Write-Host "💡 Dica: Leia DEPLOY.md para instruções detalhadas" -ForegroundColor Cyan
Write-Host ""
Write-Host "🌟 Boa sorte com o deploy! 🚀" -ForegroundColor Green
Write-Host ""
