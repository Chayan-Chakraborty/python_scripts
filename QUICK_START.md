# Quick Start Guide

## 🚀 Estimator Item Search Application

### Prerequisites
- Docker and Docker Compose installed
- MySQL database with estimator data
- OpenAI API key (optional, for AI descriptions)

### 1. Extract and Setup
```bash
# Extract the zip file
unzip estimator-search-app.zip
cd react-qdrant-app

# Make deployment script executable
chmod +x deploy.sh
```

### 2. Configure Database Connection
Edit `docker-compose.yml` and update the MySQL connection details:
```yaml
environment:
  MYSQL_HOST: your-mysql-host
  MYSQL_PORT: 3307
  MYSQL_USER: your-username
  MYSQL_PASS: your-password
  MYSQL_DB: your-database
  OPENAI_API_KEY: your-openai-key  # Optional
```

### 3. Deploy the Application
```bash
# Run the deployment script
./deploy.sh

# Or manually with docker-compose
docker-compose up --build
```

### 4. Access the Application
- **Frontend**: http://localhost:5153
- **Backend API**: http://localhost:8000
- **API Docs**: http://localhost:8000/docs

### 5. Initialize Data
The deployment script automatically initializes data, but you can also do it manually:
```bash
curl -X POST http://localhost:8000/ingest
```

## 🎯 Key Features

### Voice Search
- Click the microphone button to record audio
- Use browser speech recognition for instant results
- Supports natural language queries

### Semantic Search
- Search with natural language: "modular kitchen in Bangalore under 50k"
- Results ranked by relevance score
- Searches across all item attributes and metadata

### Detailed Item Pages
- Complete item information with AI-generated descriptions
- Area-wise statistics (Min/Max/Avg amounts)
- Similar items recommendations
- High-quality item images

### Dashboard Analytics
- Summary statistics and KPIs
- Area-wise breakdown
- Item aggregations by measurement
- Interactive data tables

## 🔧 Management Commands

```bash
# View logs
./deploy.sh logs

# Stop application
./deploy.sh stop

# Restart application
./deploy.sh restart

# Check status
./deploy.sh status
```

## 📊 Data Structure

The application works with estimator data containing:
- Item names, amounts, and descriptions
- Project and room information
- Area/city location data
- Detailed attributes (material, finish, measurement, etc.)
- Customer and estimator IDs

## 🆘 Troubleshooting

### Common Issues
1. **Port conflicts**: Ensure ports 5153, 8000, and 6333 are available
2. **MySQL connection**: Verify database credentials and connectivity
3. **Voice search**: Check browser microphone permissions
4. **No results**: Run the ingest endpoint to populate Qdrant

### Getting Help
- Check the full README.md for detailed documentation
- Review API documentation at http://localhost:8000/docs
- Check application logs: `./deploy.sh logs`

## 🎉 You're Ready!

The application is now running and ready to use. Start by searching for items using text or voice input, explore the detailed item pages, and check out the analytics dashboard.

Happy searching! 🔍
