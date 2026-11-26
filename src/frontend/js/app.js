document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("chatForm");
    const input = document.getElementById("userInput");
    const messages = document.getElementById("messages");
    const welcome = document.getElementById("welcome");
    const newChat = document.getElementById("newChat");
    const menuToggle = document.getElementById("menuToggle");
    const sidebar = document.getElementById("sidebar");

    if (menuToggle && sidebar) {
        menuToggle.addEventListener("click", () => sidebar.classList.toggle("open"));
    }

    if (!form || !input || !messages) return;

    const addMessage = (text, sender) => {
        const row = document.createElement("div");
        row.className = `message ${sender}`;

        if (sender === "bot") {
            const avatar = document.createElement("div");
            avatar.className = "avatar";
            avatar.textContent = "M";
            row.appendChild(avatar);
        }

        const content = document.createElement("div");
        content.className = "message-content";
        content.textContent = text;
        row.appendChild(content);
        messages.appendChild(row);
        messages.scrollTop = messages.scrollHeight;
    };

    const sendMessage = () => {
        const question = input.value.trim();
        if (!question) return;

        if (welcome) welcome.style.display = "none";
        addMessage(question, "user");
        input.value = "";
        input.style.height = "auto";

        // Connect this UI to the project's verified SWI-Prolog API endpoint
        // after the backend route and request/response format are implemented.
        addMessage(
            "Thanks for your question. The chat interface is ready, but the Prolog reasoning service has not been connected yet. No medical assessment has been performed. Please consult a qualified healthcare professional for personal medical advice.",
            "bot"
        );
    };

    form.addEventListener("submit", (event) => {
        event.preventDefault();
        sendMessage();
    });

    input.addEventListener("input", () => {
        input.style.height = "auto";
        input.style.height = `${Math.min(input.scrollHeight, 120)}px`;
    });

    input.addEventListener("keydown", (event) => {
        if (event.key === "Enter" && !event.shiftKey) {
            event.preventDefault();
            sendMessage();
        }
    });

    if (newChat) {
        newChat.addEventListener("click", () => {
            messages.innerHTML = "";
            if (welcome) {
                welcome.style.display = "";
                messages.appendChild(welcome);
            }
            const greeting = document.createElement("div");
            greeting.className = "message bot";
            const avatar = document.createElement("div");
            avatar.className = "avatar";
            avatar.textContent = "M";
            const content = document.createElement("div");
            content.className = "message-content";
            content.textContent = "Hello! Welcome to MediGuide. You can type your health-related questions here. How may I assist you?";
            greeting.append(avatar, content);
            messages.appendChild(greeting);
            input.value = "";
            input.style.height = "auto";
            messages.scrollTop = 0;
        });
    }
});
