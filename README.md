# 🚗 CarFixAI - Complete Full-Stack Application

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Node](https://img.shields.io/badge/node-18.x-green.svg)
![React Native](https://img.shields.io/badge/react--native-0.74-blue.svg)
![PostgreSQL](https://img.shields.io/badge/postgresql-15-blue.svg)

**Complete automotive diagnostic platform with React Native mobile app + Node.js backend + PostgreSQL database.**

🔗 **[Live Demo](#)** | 📱 **[Download APK](#)** | 📚 **[Documentation](#)**

---

## 📦 What's Included

### ✅ React Native Mobile App (Frontend)
- **36 Fully Coded Screens**
- Industrial AI dark theme
- Authentication flow (Login, Signup, OTP)
- Vehicle management with VIN scanner
- OBD-II diagnostic scanning
- Parts shop with search
- Mechanics finder (Google Maps)
- AI chat assistant
- Stripe payment integration
- Complete navigation flows

### ✅ Node.js Backend API
- **Express.js** REST API
- **JWT** authentication
- **Prisma ORM** for database
- All endpoints implemented:
  - Auth (signup, login, OTP)
  - Vehicles (CRUD, VIN scanning)
  - Diagnostics (scan, history)
  - Shop (parts, mechanics, orders)
  - AI (chat, image analysis)
  - Payments (Stripe)

### ✅ PostgreSQL Database
- Complete Prisma schema
- 13 models with relationships
- Migrations ready
- Seed data included

### ✅ Deployment Ready
- Docker Compose setup
- IONOS Deploy Now configuration
- Railway/Heroku compatible
- Environment templates

---

## 🚀 Quick Start

### Option 1: Docker (Recommended)

```bash
# Clone repository
git clone https://github.com/Owwmann/CarFixAI-FullStack.git
cd CarFixAI-FullStack

# Start with Docker
docker-compose up -d

# Run migrations
docker exec carfixai-backend npx prisma migrate dev --name init

# Seed database
docker exec carfixai-backend npm run seed

# ✅ Backend running at http://localhost:3000
```

### Option 2: Manual Setup

**Backend:**
```bash
cd backend
npm install
cp .env.example .env
# Edit .env with your database URL
npx prisma migrate dev
npm run seed
npm run dev
```

**Mobile App:**
```bash
cd mobile
npm install
# Update API URL in src/constants/index.ts
npm start
```

---

## 🌐 Deploy to IONOS (1-Click)

### Step 1: Go to IONOS Deploy Now
👉 **[Deploy Now](https://www.ionos.com/hosting/deploy-now)**

### Step 2: Connect This Repository
- Click "Deploy from GitHub"
- Select: **Owwmann/CarFixAI-FullStack**
- Choose branch: **main**

### Step 3: Configure Environment
Add these environment variables in IONOS dashboard:

```env
DATABASE_URL=postgresql://user:pass@host:5432/carfixai
JWT_SECRET=your-super-secret-key-32-chars-min
NODE_ENV=production
STRIPE_SECRET_KEY=sk_live_your_key
```

### Step 4: Deploy!
- Click "Deploy"
- Wait 2-5 minutes
- Your backend will be live! 🎉

**📖 Full deployment guide:** [IONOS_DEPLOYMENT.md](./IONOS_DEPLOYMENT.md)

---

## 📁 Project Structure

```
CarFixAI-FullStack/
├── backend/                    # Node.js API
│   ├── src/
│   │   ├── controllers/       # Business logic
│   │   ├── routes/            # API endpoints
│   │   ├── middleware/        # Auth, validation
│   │   ├── utils/             # Seed data
│   │   └── server.js          # Express app
│   ├── prisma/
│   │   └── schema.prisma      # Database schema
│   └── package.json
│
├── mobile/                     # React Native app
│   ├── src/
│   │   ├── screens/           # 36 screens
│   │   ├── components/        # Reusable UI
│   │   ├── navigation/        # Navigation
│   │   ├── services/          # API calls
│   │   └── theme/             # Styling
│   └── package.json
│
├── docker-compose.yml          # Docker setup
├── .deploy-now/               # IONOS config
└── README.md
```

---

## 🔧 Configuration

### Backend (.env)
```env
PORT=3000
DATABASE_URL="postgresql://user:password@localhost:5432/carfixai"
JWT_SECRET=your-super-secret-jwt-key
STRIPE_SECRET_KEY=sk_test_...
NODE_ENV=development
```

### Mobile (src/constants/index.ts)
```typescript
BASE_URL: 'http://YOUR_IP:3000',  // Use actual IP, not localhost
STRIPE_PUBLISHABLE_KEY: 'pk_test_...',
GOOGLE_MAPS_API_KEY: 'AIza...',
```

---

## 📱 Build Mobile APK

### Using Expo EAS (Easiest)
```bash
cd mobile
npm install -g eas-cli
eas login
eas build --platform android --profile preview
```

### Using Android Studio
```bash
cd mobile
expo prebuild
cd android
./gradlew assembleRelease
```

**APK location:** `android/app/build/outputs/apk/release/`

---

## 📊 API Endpoints

### Authentication
- `POST /api/auth/signup` - Create account
- `POST /api/auth/login` - Login
- `POST /api/auth/verify-otp` - Verify OTP

### Vehicles
- `POST /api/vehicle/add` - Add vehicle
- `GET /api/vehicle/list` - Get vehicles
- `POST /api/vehicle/scan-vin` - Scan VIN

### Diagnostics
- `POST /api/diagnostics/scan` - Run scan
- `GET /api/diagnostics/history` - History

### Shop
- `GET /api/shop/parts/search` - Search parts
- `GET /api/shop/mechanics/nearby` - Find mechanics
- `POST /api/shop/book` - Book appointment

### AI
- `POST /api/ai/chat` - Chat with AI
- `POST /api/ai/analyze-image` - Analyze image

### Payments
- `POST /api/payment/create-intent` - Create payment
- `POST /api/payment/confirm` - Confirm payment

**Full API docs:** See backend/README.md

---

## 🗄️ Database Schema

### Main Tables
- **User** - Authentication & profiles
- **Vehicle** - User vehicles
- **Diagnostic** - Scan results
- **MaintenanceLog** - Service history
- **Part** - Parts catalog
- **Mechanic** - Service providers
- **Appointment** - Bookings
- **Order** - E-commerce
- **Payment** - Transactions
- **AIConversation** - Chat history

All relationships configured with proper indexes and cascading deletes.

---

## 🧪 Testing

### Backend
```bash
# Health check
curl http://localhost:3000/health

# Signup
curl -X POST http://localhost:3000/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"test1234","name":"Test"}'
```

### Mobile
1. Start backend: `cd backend && npm run dev`
2. Update API URL in mobile app
3. Run: `cd mobile && npm start`
4. Scan QR with Expo Go app

---

## 🚢 Deployment Options

### Backend
- ✅ **IONOS Deploy Now** (recommended)
- Railway
- Heroku
- DigitalOcean
- AWS/GCP

### Database
- IONOS PostgreSQL
- Supabase
- ElephantSQL
- Railway DB

### Mobile
- Expo EAS Build
- Android Studio
- Google Play Store

---

## 💰 Cost Estimate

- Backend Hosting: $5-15/month
- Database: $7-15/month
- Google Play: $25 one-time
- Expo EAS: Free tier available
- **Total: ~$15-30/month**

---

## 📚 Documentation

- [Backend Setup](./backend/README.md)
- [Mobile App Setup](./mobile/README.md)
- [IONOS Deployment](./IONOS_DEPLOYMENT.md)
- [Deployment Guide](./DEPLOYMENT_GUIDE.md)
- [API Documentation](./API.md)

---

## 🛠️ Tech Stack

**Frontend:**
- React Native 0.74
- Expo SDK 51
- React Navigation 6
- TypeScript
- Stripe React Native

**Backend:**
- Node.js 18+
- Express.js
- Prisma ORM
- PostgreSQL 15
- JWT Auth
- Stripe API

**DevOps:**
- Docker
- Docker Compose
- GitHub Actions
- IONOS Deploy Now

---

## 🤝 Contributing

Contributions welcome! Please read [CONTRIBUTING.md](./CONTRIBUTING.md) first.

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing`)
5. Open Pull Request

---

## 📄 License

This project is licensed under the MIT License - see [LICENSE](./LICENSE) file.

---

## 🙏 Acknowledgments

- React Native & Expo teams
- Prisma for amazing ORM
- Stripe for payment processing
- IONOS for easy deployment

---

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/Owwmann/CarFixAI-FullStack/issues)
- **Discussions:** [GitHub Discussions](https://github.com/Owwmann/CarFixAI-FullStack/discussions)
- **Email:** support@carfixai.com

---

## ⭐ Star This Repo

If you find this project useful, please consider giving it a star! ⭐

---

**Built with ❤️ for the automotive community**

🚗 **CarFixAI** - Making vehicle diagnostics accessible to everyone
