# AI Chatbot APP
<img src="/assets/images/app_icon.png" alt="App Icon" title="App Icon" height="100"/> 

## **Overview**
This is a Flutter-based mobile app created as part of my portfolio to demonstrate my skills in mobile development. The app integrates OpenAI's API to provide a seamless and interactive AI chatbot experience. Users can customize their AI and user profiles, including names and profile pictures, and enjoy a smooth, real-time chat experience. Through this project, I aimed to deepen my understanding of REST APIs, custom AI training, and dynamic UI design.

---

## **Skills Showcase**
- **Flutter & Dart**: Built a responsive and performant mobile app using Flutter widgets and Dart programming.
- **State Management**: Implemented Provider for efficient state management.
- **API Integration**: Integrated OpenAI's API to enable real-time AI-driven chat functionality.
- **UI/UX Design**: Designed a clean and intuitive user interface with customizable profiles.
- **Version Control**: Used Git and GitHub for version control, ensuring secure handling of API keys by disabling `*.env` in `.gitignore`.
- **Debugging & Testing**: Tested the app on both Android and iOS devices. Used Device Manager to test different screen sizes and Dart DevTools for performance analysis.
  
---

## **Features**
- Customizable Profiles: Change AI and user names, profile pictures, and developer instructions.
- Real-Time Chat: Smooth and responsive chat experience powered by OpenAI's API.
- Dynamic AI Responses: AI adapts to custom developer instructions for personalized interactions.
- Responsive Design: Optimized for multiple screen sizes and devices.
  
---

## **Technologies Used**
- **Frontend**: Flutter, Dart
- **State Management**: Provider
- **Backend**: Dart
- **APIs**: [OpenAI API](https://platform.openai.com/docs/overview)
- **Packages**: `Http`, `Provider`, `Device Preview`, `DotEnv`
- **Development Tools**: Git, Android Studio, VS Code, XCode
  
---

## **Challenges & Learnings**
Throughout this project, I encountered several challenges that helped me grow as a developer. Here are some key takeaways:  

### **Technical Challenges**  

- **Handling Real-Time Chat Smoothness**
  - **Solution:** Optimized API calls and implemented a streaming mechanism to ensure a seamless chat experience without delays.
  
- **Custom AI Training Integrations** 
  - **Solution:** Added a `developer role` message to AI's message list with pre-traing insturctions provided by user.
  
- **Dynamic Profile Customization** 
  - **Solution:** Used `Provider` to update user's profile picture during conversation.
  
### **Key Learnings & Improvements**  
- **Strengthened my understanding** of REST APIs and JSON data handling in Flutter.  
- **Explored advanced state management** techniques to handle dynamic UI updates efficiently.
- **Learned how to** optimize API usage to reduce latency and improve app performance.
- **Gained experience** in creating customizable and user-friendly interfaces for enhanced user engagement.

---

## **Installation**
1. Clone the repository:

   ```bash
   git clone https://github.com/AlexanderRavenscroft/ai_chatbot_app.git
   ```
   
2. Navigate to the project directory:

   ```bash
   cd ai_chatbot_app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```
   
4. Set Up OpenAI API Key:
  - Go to [OpenAI's Platform](https://platform.openai.com/docs/overview) and sign up or log in.
  - Navigate to the API keys section and generate a new API key.
  - Create a `.env` file in the root directory of the project.
    > This file dont have a name, just `.env`
  - Add your API key to the .env file as follows:

    ```plaintext
    apiKey = 'your_openai_api_key_here'
    ```

    > Ensure the .env file is added to .gitignore to prevent exposing your API key in version control, if You plan to upload your version of the app.
      
5. Run the app:

   ```bash
   flutter run
   ```
   
---

## **LICENSE**
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## **GitHub Disclaimer**
I’m still learning Git and improving my workflow. As a result:
- Some repositories might be messy due to experimentation.
- The commit dates may appear non-chronological as I often work on multiple projects simultaneously.
- I work on multiple devices, which sometimes leads to inconsistencies in commit authorship.
- I recently changed my GitHub username, so older commits may still show my previous name (ShenAbuser).

Thanks for understanding as I continue to grow as a developer!

---

## **My other projects**
**Message Chat App** – A real-time chat application with messaging features: [GitHub Repo](https://github.com/AlexanderRavenscroft/chat_app)

**Halo App** – A real-time location based wethear application with animations: [GitHub Repo](https://github.com/AlexanderRavenscroft/halo_app)

**Talk! but Carefully** - A dynamic, family game with multiple team settings options, and sound effects: [GitHub Repo](https://github.com/AlexanderRavenscroft/talk_but_carefully_app)

**Wordle** - A minimal wordle game with API word fetching: [GitHub Repo](https://github.com/AlexanderRavenscroft/wordle_app)

---

## **Connect with Me**
Email: alex.ravenscroft.dev@gmail.com

Fiver: https://www.fiverr.com/alexander_raven




