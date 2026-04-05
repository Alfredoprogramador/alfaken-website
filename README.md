# Alfaken Startup - Website Profissional

Site profissional da Alfaken Startup, destacando serviços de desenvolvimento de software, web, e-commerce, design e automação.

## 🌍 Múltiplos Idiomas

O site suporta **3 idiomas**:
- 🇧🇷 Português (padrão)
- 🇺🇸 Inglês
- 🇪🇸 Espanhol

O idioma pode ser alterado através do seletor no header. A preferência é salva automaticamente.

📖 [Documentação completa de idiomas](MULTILANGUAGE.md)

## 🚀 Funcionalidades

- **Design Moderno**: Esquema de cores em tons de azul com gradientes e animações suaves
- **Portfólio Completo**: Showcase de projetos concluídos com filtros interativos
- **Serviços Detalhados**: Apresentação completa de todos os serviços oferecidos
- **Formulário de Contato**: Sistema de contato direto com validação
- **Responsivo**: Layout totalmente adaptável para dispositivos móveis e tablets
- **Navegação Suave**: Scroll suave entre seções e menu mobile funcional
- **Animações**: Elementos com animações ao scroll para melhor experiência

## 📁 Estrutura do Projeto

```
alfaken-website/
│
├── index.html          # Página principal
├── styles.css          # Estilos CSS
├── script.js           # JavaScript/Interatividade
├── translations.js     # Sistema de traduções (PT/EN/ES)
├── README.md          # Documentação principal
├── MULTILANGUAGE.md   # Documentação de idiomas
├── debug-test.html    # Página de depuração
├── test-console.html  # Console de testes
└── debug.ps1          # Script de validação
```

## 🎨 Características de Design

- **Paleta de Cores**:
  - Azul Primário: #0066ff
  - Azul Escuro: #003d99
  - Azul Claro: #4d94ff
  - Azul Accent: #00ccff
  - Fundo Escuro: #0a1929

- **Tipografia**: Segoe UI, sistema de fontes moderno
- **Ícones**: Font Awesome 6.4.0
- **Layout**: CSS Grid e Flexbox para responsividade

## 🔧 Tecnologias Utilizadas

- HTML5 semântico
- CSS3 com variáveis e animações
- JavaScript ES6+ (Vanilla)
- Font Awesome para ícones

## 📱 Seções do Site

1. **Hero/Início**: Apresentação impactante da empresa
2. **Serviços**: 6 categorias principais de serviços
   - Desenvolvimento de Software
   - Desenvolvimento Web
   - E-commerce
   - Design Digital
   - Automação de Processos
   - Aplicativos Mobile

3. **Portfólio**: Galeria de projetos com filtros
   - 6 projetos demonstrativos
   - Filtros por categoria (Web, E-commerce, App, Automação)
   - Tags de tecnologias utilizadas

4. **Contato**: Formulário completo e informações
   - Formulário com validação
   - Informações de contato
   - Links de redes sociais

5. **Footer**: Rodapé com links e newsletter

## 🚀 Deploy em Produção com HTTPS

O site está pronto para deploy em produção com HTTPS automático!

### Opções Recomendadas:

**1. Vercel** ⭐⭐⭐⭐⭐ (Mais Fácil)
- Deploy em 2 minutos
- HTTPS automático
- CDN global
- 100% Gratuito

**2. Netlify** ⭐⭐⭐⭐⭐
- Drag & drop deploy
- HTTPS automático
- 100% Gratuito

**3. GitHub Pages + Cloudflare** ⭐⭐⭐⭐
- Totalmente gratuito
- Requer configuração de DNS

### 🎯 Deploy Rápido:

**Script Automático:**
```powershell
.\deploy.ps1
```

**Ou siga o guia visual:**
1. Abra `deploy-guide.html` no navegador
2. Escolha uma plataforma
3. Siga o passo a passo

📖 [Guia Completo de Deploy](DEPLOY.md)

---

## 🌐 Deploy no GitHub Pages (Alternativa)

### Passo 1: Criar Repositório no GitHub

1. Acesse [GitHub](https://github.com) e faça login
2. Clique em "New repository"
3. Nome do repositório: `alfaken-website` (ou qualquer nome de sua preferência)
4. Marque como "Public"
5. Clique em "Create repository"

### Passo 2: Conectar com GitHub

Execute os seguintes comandos no terminal:

```bash
# Inicialize o repositório Git
git init

# Adicione todos os arquivos
git add .

# Faça o primeiro commit
git commit -m "Initial commit - Alfaken Startup Website"

# Conecte com o repositório remoto (substitua USERNAME pelo seu usuário)
git remote add origin https://github.com/USERNAME/alfaken-website.git

# Envie os arquivos para o GitHub
git branch -M main
git push -u origin main
```

### Passo 3: Ativar GitHub Pages

1. Vá até o repositório no GitHub
2. Clique em "Settings" (Configurações)
3. No menu lateral, clique em "Pages"
4. Em "Source", selecione "main" branch
5. Clique em "Save"
6. Aguarde alguns minutos e seu site estará disponível em: `https://USERNAME.github.io/alfaken-website/`

## 🛠️ Personalização

### Alterar Informações de Contato

No arquivo `index.html`, procure pela seção `<section id="contact">` e edite:

```html
<p>contato@alfaken.com.br</p>
<p>+55 (11) 98765-4321</p>
<p>São Paulo, SP - Brasil</p>
```

### Adicionar Projetos ao Portfólio

No arquivo `index.html`, na seção `<section id="portfolio">`, adicione novos itens seguindo o padrão:

```html
<div class="portfolio-item" data-category="categoria">
    <!-- Conteúdo do projeto -->
</div>
```

### Modificar Cores

No arquivo `styles.css`, altere as variáveis CSS no topo:

```css
:root {
    --primary-blue: #0066ff;
    --dark-blue: #003d99;
    /* ... outras cores ... */
}
```

## 📧 Integração de Formulário

O formulário atualmente exibe um alerta. Para integrar com backend:

1. **EmailJS**: Serviço gratuito para envio de emails
2. **Formspree**: Formulários sem backend
3. **Backend próprio**: Node.js, PHP, Python, etc.

Exemplo com EmailJS no `script.js`:

```javascript
// Substitua a função atual do formulário por:
emailjs.sendForm('YOUR_SERVICE_ID', 'YOUR_TEMPLATE_ID', this)
    .then(() => {
        alert('Mensagem enviada com sucesso!');
    }, (error) => {
        alert('Erro ao enviar mensagem.');
    });
```

## 🔄 Atualizações Futuras Sugeridas

- [ ] Integração com CMS (Content Management System)
- [ ] Blog/Notícias
- [ ] Galeria de imagens real dos projetos
- [ ] Sistema de depoimentos de clientes
- [ ] Chat online
- [ ] Multi-idioma
- [ ] Analytics (Google Analytics)
- [ ] SEO avançado

## 📄 Licença

Este projeto é de propriedade da Alfaken Startup.

## 👥 Suporte

Para dúvidas ou suporte:
- Email: contato@alfaken.com.br
- Website: [Em breve]

---

Desenvolvido com 💙 pela Alfaken Startup
