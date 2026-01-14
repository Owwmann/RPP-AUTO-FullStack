# 🚀 IONOS Deploy Now - Deployment Guide

This guide will help you deploy CarFixAI to IONOS hosting using Deploy Now.

## 📋 Prerequisites

1. IONOS account (free tier available)
2. GitHub account (already connected)
3. This repository: https://github.com/Owwmann/CarFixAI-FullStack

---

## 🌐 STEP 1: Setup IONOS Deploy Now

### 1. Go to IONOS Deploy Now
Visit: https://www.ionos.com/hosting/deploy-now

### 2. Sign Up / Login
- Create free IONOS account
- Or login if you have one

### 3. Connect GitHub
- Click "Deploy Now"
- Authorize IONOS to access your GitHub
- Select the repository: **Owwmann/CarFixAI-FullStack**

---

## 🗄️ STEP 2: Setup Database

### Option A: IONOS Database (Recommended)

1. **In IONOS Dashboard:**
   - Go to "Databases"
   - Create new PostgreSQL database
   - Note down connection details

2. **Database Credentials:**
   ```
   Host: your-db.ionos.com
   Port: 5432
   Database: carfixai
   User: your-username
   Password: your-password
   ```

3. **Connection String:**
   ```
   postgresql://username:password@host:5432/carfixai
   ```

### Option B: External Database (Alternative)

Use Supabase, ElephantSQL, or Railway:

1. Go to https://supabase.com (free tier)
2. Create new project
3. Get PostgreSQL connection string
4. Use in IONOS environment variables

---

## ⚙️ STEP 3: Configure Environment Variables

In IONOS Deploy Now dashboard, add these environment variables:

### Required Variables:

```env
DATABASE_URL=postgresql://user:pass@host:5432/carfixai
JWT_SECRET=your-super-secret-jwt-key-min-32-chars
NODE_ENV=production
PORT=3000
```

### Optional Variables:

```env
STRIPE_SECRET_KEY=sk_live_your_stripe_key
OPENAI_API_KEY=sk-your-openai-key
GOOGLE_MAPS_API_KEY=AIza-your-maps-key
```

**IMPORTANT:** Generate a strong JWT_SECRET:
```bash
# Run this command to generate secure key:
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

---

## 🚀 STEP 4: Deploy Backend

### 1. Configure Build Settings in IONOS:

**Build Directory:** `backend`  
**Build Command:** `npm install && npx prisma generate`  
**Start Command:** `npm start`  
**Node Version:** 18.x

### 2. Deploy:
- Click "Deploy"
- Wait 2-5 minutes for build
- Backend will be live at: `https://carfixai-backend.project.ionos.space`

### 3. Run Database Migration:

After first deployment, run migrations via IONOS SSH or terminal:

```bash
npx prisma migrate deploy
npm run seed
```

Or use the IONOS web terminal in dashboard.

---

## 📱 STEP 5: Configure Mobile App

Update mobile app API URL:

1. Edit `mobile/src/constants/index.ts`:
   ```typescript
   BASE_URL: 'https://carfixai-backend.project.ionos.space',
   ```

2. Build mobile APK with updated URL (see mobile/README.md)

---

## ✅ STEP 6: Test Deployment

### 1. Health Check:
```bash
curl https://carfixai-backend.project.ionos.space/health
```

Should return:
```json
{"status":"ok","timestamp":"..."}
```

### 2. Test Signup:
```bash
curl -X POST https://carfixai-backend.project.ionos.space/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"password123","name":"Test User"}'
```

### 3. Test Login:
```bash
curl -X POST https://carfixai-backend.project.ionos.space/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"password123"}'
```

---

## 🔄 CONTINUOUS DEPLOYMENT

IONOS Deploy Now automatically deploys when you push to GitHub:

```bash
# Make changes locally
git add .
git commit -m "Update feature"
git push origin main

# IONOS will automatically detect and deploy!
```

---

## 📊 IONOS Dashboard Features

- **Logs:** View build and runtime logs
- **Metrics:** Monitor CPU, memory, requests
- **Domain:** Connect custom domain
- **SSL:** Free SSL certificate included
- **Scale:** Upgrade plan for more resources

---

## 🔐 Security Checklist

- [ ] Use strong JWT_SECRET (32+ characters)
- [ ] Enable HTTPS only (automatic with IONOS)
- [ ] Set NODE_ENV=production
- [ ] Use live Stripe keys (not test)
- [ ] Enable database backups
- [ ] Set up monitoring alerts
- [ ] Review CORS settings in backend

---

## 💰 IONOS Pricing

**Free Tier Includes:**
- 1 project
- 100 GB bandwidth
- Free SSL
- GitHub integration
- Custom domain support

**Paid Plans:** Starting at €1/month for more resources

---

## 🐛 Troubleshooting

### Build Fails:
1. Check Node.js version (should be 18.x)
2. Verify package.json exists in backend folder
3. Check IONOS build logs

### Database Connection Error:
1. Verify DATABASE_URL is correct
2. Check database is accessible from IONOS servers
3. Ensure database user has proper permissions

### API Returns 500 Error:
1. Check IONOS runtime logs
2. Verify all environment variables are set
3. Ensure database migrations ran successfully

### Can't Access Backend:
1. Verify deployment status in IONOS dashboard
2. Check custom domain DNS settings
3. Wait 5-10 minutes for DNS propagation

---

## 📞 Support Resources

- **IONOS Support:** https://www.ionos.com/help
- **Deploy Now Docs:** https://docs.ionos.space/docs
- **Community Forum:** https://community.ionos.com

---

## 🎉 Deployment Complete!

Your CarFixAI backend is now live on IONOS!

**Backend URL:** `https://carfixai-backend.project.ionos.space`  
**Status Dashboard:** Check IONOS Deploy Now dashboard  
**GitHub Repo:** https://github.com/Owwmann/CarFixAI-FullStack

Update your mobile app with the production backend URL and you're ready to launch!

**Happy Deploying! 🚀**
