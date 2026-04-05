# 🚀 Guia de Deploy em Produção - Alfaken Startup

## Opções de Hospedagem com HTTPS Gratuito

### 🎯 Recomendações por Ordem de Facilidade:

1. **Vercel** ⭐⭐⭐⭐⭐ (Mais Fácil + Rápido)
2. **Netlify** ⭐⭐⭐⭐⭐ (Excelente)
3. **GitHub Pages + Cloudflare** ⭐⭐⭐⭐ (Gratuito)
4. **Servidor VPS** ⭐⭐⭐ (Avançado)

---

## 🚀 OPÇÃO 1: Vercel (RECOMENDADO)

### Por que Vercel?
- ✅ Deploy em 2 minutos
- ✅ HTTPS automático
- ✅ Domínio customizado gratuito
- ✅ CDN global
- ✅ SSL/TLS automático
- ✅ Renovação automática de certificados
- ✅ Zero configuração

### Passo a Passo:

#### 1. Criar Conta na Vercel
```
1. Acesse: https://vercel.com
2. Clique em "Sign Up"
3. Conecte com GitHub
```

#### 2. Importar Projeto do GitHub

**Primeiro, envie o projeto para GitHub:**
```bash
# Inicializar Git (se ainda não fez)
git init

# Adicionar arquivos
git add .

# Commit inicial
git commit -m "Deploy to production"

# Criar repositório no GitHub em: https://github.com/new
# Nome sugerido: alfaken-website

# Conectar com GitHub
git remote add origin https://github.com/SEU_USUARIO/alfaken-website.git

# Enviar para GitHub
git branch -M main
git push -u origin main
```

**Depois, importar na Vercel:**
```
1. No Vercel Dashboard, clique em "Add New Project"
2. Selecione "Import Git Repository"
3. Escolha seu repositório: alfaken-website
4. Clique em "Deploy"
5. Aguarde 1-2 minutos ✨
```

#### 3. Configurar Domínio Próprio

**Se você tem um domínio (exemplo: alfaken.com.br):**

```
1. No Vercel Dashboard, vá em Settings → Domains
2. Adicione seu domínio: alfaken.com.br
3. Configure os DNS (veja seção DNS abaixo)
4. Aguarde propagação (pode levar até 48h, normalmente 1h)
```

**DNS Records para Vercel:**
```
Tipo: A
Nome: @
Valor: 76.76.21.21

Tipo: CNAME
Nome: www
Valor: cname.vercel-dns.com
```

#### 4. HTTPS Automático
A Vercel configura HTTPS automaticamente! Nada a fazer. 🎉

---

## 🌐 OPÇÃO 2: Netlify

### Passo a Passo:

#### 1. Criar Conta
```
1. Acesse: https://netlify.com
2. Clique em "Sign Up"
3. Conecte com GitHub
```

#### 2. Deploy

**Método 1: Via GitHub (Recomendado)**
```
1. Envie projeto para GitHub (veja comandos acima)
2. No Netlify, clique em "Add new site"
3. Escolha "Import an existing project"
4. Conecte com GitHub
5. Selecione o repositório
6. Clique em "Deploy"
```

**Método 2: Drag & Drop**
```
1. No Netlify Dashboard, arraste a pasta do projeto
2. Solte na área indicada
3. Aguarde upload e deploy
```

#### 3. Configurar Domínio

```
1. Vá em Site settings → Domain management
2. Clique em "Add custom domain"
3. Digite seu domínio: alfaken.com.br
4. Siga instruções de DNS
```

**DNS Records para Netlify:**
```
Tipo: A
Nome: @
Valor: 75.2.60.5

Tipo: CNAME
Nome: www
Valor: SEU_SITE.netlify.app
```

#### 4. Ativar HTTPS
```
1. Vá em Domain settings → HTTPS
2. Clique em "Verify DNS configuration"
3. Clique em "Provision certificate"
4. Aguarde 1-2 minutos
```

---

## 📘 OPÇÃO 3: GitHub Pages + Cloudflare

### Vantagens:
- ✅ 100% Gratuito
- ✅ HTTPS via Cloudflare
- ✅ CDN global
- ✅ Proteção DDoS

### Passo a Passo:

#### 1. Deploy no GitHub Pages
```bash
# Enviar para GitHub
git init
git add .
git commit -m "Initial production deploy"
git remote add origin https://github.com/SEU_USUARIO/alfaken-website.git
git push -u origin main
```

```
No GitHub:
1. Vá em Settings → Pages
2. Source: "Deploy from branch"
3. Branch: main
4. Folder: / (root)
5. Clique em "Save"
6. Aguarde deploy (1-2 minutos)
```

Seu site estará em: `https://SEU_USUARIO.github.io/alfaken-website/`

#### 2. Configurar Domínio no GitHub

```
1. No GitHub Pages settings, em "Custom domain"
2. Digite seu domínio: www.alfaken.com.br
3. Clique em "Save"
4. Marque "Enforce HTTPS" (depois da configuração DNS)
```

#### 3. Configurar Cloudflare

**Criar conta e adicionar site:**
```
1. Acesse: https://cloudflare.com
2. Cadastre-se (gratuito)
3. Clique em "Add a Site"
4. Digite seu domínio: alfaken.com.br
5. Escolha plano "Free"
6. Continue
```

**Configurar DNS no Cloudflare:**
```
Tipo: CNAME
Nome: www
Conteúdo: SEU_USUARIO.github.io
Proxy status: Proxied (nuvem laranja)

Tipo: CNAME
Nome: @
Conteúdo: SEU_USUARIO.github.io
Proxy status: Proxied (nuvem laranja)
```

**Configurar SSL no Cloudflare:**
```
1. Vá em SSL/TLS
2. Escolha modo: "Full"
3. Ative "Always Use HTTPS"
4. Ative "Automatic HTTPS Rewrites"
```

#### 4. Atualizar Nameservers

Cloudflare fornecerá 2 nameservers. Configure no seu registrador de domínio:

```
Exemplo:
ns1.cloudflare.com
ns2.cloudflare.com
```

Aguarde propagação DNS (até 48h, normalmente algumas horas).

---

## 🛒 Onde Comprar Domínio

### Registradores Recomendados:

**Brasil:**
- **Registro.br** 🇧🇷 (domínios .br)
  - https://registro.br
  - Preço: ~R$ 40/ano
  - Mais confiável para .com.br

- **HostGator Brasil**
  - https://hostgator.com.br
  - Preço: ~R$ 40/ano
  - Suporte em português

**Internacional:**
- **Namecheap**
  - https://namecheap.com
  - Preço: ~$10-15/ano
  - WHOIS Protection gratuito

- **Google Domains**
  - https://domains.google
  - Preço: ~$12/ano
  - Integração com Google

- **Cloudflare Registrar**
  - https://cloudflare.com/products/registrar
  - Preço: Custo (sem markup)
  - Melhor preço

---

## 🔧 Configurações Adicionais

### CNAME para GitHub Pages

Crie arquivo `CNAME` na raiz do projeto:

```
www.alfaken.com.br
```

### Robots.txt

Crie `robots.txt` para SEO:

```
User-agent: *
Allow: /

Sitemap: https://www.alfaken.com.br/sitemap.xml
```

### Sitemap.xml

Crie `sitemap.xml` para SEO:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://www.alfaken.com.br/</loc>
    <lastmod>2024-01-01</lastmod>
    <changefreq>monthly</changefreq>
    <priority>1.0</priority>
  </url>
</urlset>
```

---

## ✅ Checklist de Deploy

- [ ] Código enviado para GitHub
- [ ] Conta criada na plataforma de hospedagem (Vercel/Netlify)
- [ ] Deploy realizado com sucesso
- [ ] Domínio registrado
- [ ] DNS configurado
- [ ] HTTPS ativado e funcionando
- [ ] Redirecionamento www → não-www (ou vice-versa)
- [ ] Arquivo CNAME criado (se GitHub Pages)
- [ ] robots.txt criado
- [ ] sitemap.xml criado
- [ ] Google Analytics configurado
- [ ] Google Search Console verificado
- [ ] Teste de velocidade (PageSpeed Insights)
- [ ] Teste em múltiplos dispositivos
- [ ] Teste em múltiplos navegadores

---

## 🎯 Exemplo Completo: Vercel

**URL após deploy:**
```
https://alfaken-website.vercel.app (temporário)
https://www.alfaken.com.br (seu domínio)
```

**Comandos completos:**
```bash
# 1. Enviar para GitHub
git init
git add .
git commit -m "Production deployment"
git remote add origin https://github.com/alfaken/website.git
git push -u origin main

# 2. Importar na Vercel (via interface web)
# 3. Configurar domínio na Vercel
# 4. Atualizar DNS no registrador
# 5. Aguardar propagação

# ✅ PRONTO! Site no ar com HTTPS!
```

---

## 🔒 Segurança HTTPS

### Verificação SSL

Após deploy, verifique SSL:
- https://www.ssllabs.com/ssltest/

Deve obter nota **A** ou **A+**

### Cabeçalhos de Segurança

Adicione no Vercel/Netlify (via `vercel.json` ou `netlify.toml`):

**vercel.json:**
```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        },
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        },
        {
          "key": "X-XSS-Protection",
          "value": "1; mode=block"
        },
        {
          "key": "Referrer-Policy",
          "value": "strict-origin-when-cross-origin"
        }
      ]
    }
  ]
}
```

---

## 📊 Monitoramento

### Ferramentas Gratuitas:

1. **Google Analytics**
   - https://analytics.google.com
   - Rastreamento de visitantes

2. **Google Search Console**
   - https://search.google.com/search-console
   - Monitoramento SEO

3. **Uptime Robot**
   - https://uptimerobot.com
   - Monitoramento de uptime

4. **Cloudflare Analytics**
   - Estatísticas de tráfego
   - Proteção contra ataques

---

## 💰 Custos Estimados

### Opção Econômica (Recomendada):
```
Domínio .com.br: R$ 40/ano
Hospedagem Vercel: GRATUITO
HTTPS/SSL: GRATUITO
CDN: GRATUITO
---
Total: R$ 40/ano (~R$ 3,30/mês)
```

### Opção Profissional:
```
Domínio .com: $12/ano
Hospedagem Vercel Pro: $20/mês
Email profissional: $6/mês (Google Workspace)
---
Total: ~$26/mês
```

---

## 🆘 Troubleshooting

### Site não carrega após deploy
- Verifique se os arquivos foram enviados corretamente
- Limpe cache do navegador (Ctrl + F5)
- Aguarde propagação DNS (até 48h)

### HTTPS não funciona
- Aguarde provisão do certificado (1-2 minutos)
- Verifique configuração DNS
- Use SSL Checker: https://www.sslshopper.com/ssl-checker.html

### Domínio não resolve
- Verifique nameservers no registrador
- Use DNS Checker: https://dnschecker.org
- Aguarde propagação (normalmente 1-6 horas)

---

## 📞 Suporte

**Vercel:** https://vercel.com/support  
**Netlify:** https://netlify.com/support  
**Cloudflare:** https://support.cloudflare.com

---

**Desenvolvido com 💙 pela Alfaken Startup**
