# 🏁 Endurance Stint Master

Endurance Stint Master is a mobile application built for organizing and managing driver stints during endurance racing events. Whether you're a team manager or a driver, this app helps you plan stints, track timing, and keep everyone on the same page — so you can focus on winning.

## 🚀 Features

- 📅 Create and manage race events
- 👥 Add and assign drivers to stints
- ⏱️ Live stint timing and driver alerts
- 📊 Fuel and tire strategy tracking (coming soon!)
- 🔔 Push notifications for upcoming stints (planned)
- 🧠 Smart stint suggestions based on driver fatigue and performance (planned)

## 🧰 Tech Stack

- **Frontend**: Flutter
- **Backend**: Golang (Gin)
- **Database**: PostgreSQL
- **Authentication**: (Planned) Firebase or custom JWT-based
- **Hosting**: TBD

## 🧭 Diagrams

Here’s a basic data model to show how the core entities in the system relate to each other:

<p align="center">
  <img src="https://github.com/user-attachments/assets/d21b6c42-733a-4301-a171-dbfdbaf8e916" alt="Entity Relationship Diagram" width="700"/>
</p>

## 📲 Screenshots

> Add screenshots or screen recordings here once available

## 🛠️ Setup & Development

### Prerequisites

- Flutter SDK
- Golang (1.20+)
- PostgreSQL

### Backend Setup

```bash
cd backend
go mod tidy
go run main.go
