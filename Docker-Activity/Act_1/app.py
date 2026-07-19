from flask import Flask, request
import psycopg2

app = Flask(__name__)

@app.route('/', methods=["GET", "POST"])
def home():
    database = psycopg2.connect(
        host="db",
        database="messages_db",
        user="postgres",
        password="1234"
    )
    
    cursor = database.cursor()
    
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS messages (
            id SERIAL PRIMARY KEY,
            message TEXT
        )
    """)
    
    if request.method == "POST":
        message = request.form["message"]

        cursor.execute(
            "INSERT INTO messages (message) VALUES (%s)",
            (message,)
        )

        database.commit()

    cursor.execute("SELECT message FROM messages")
    messages = cursor.fetchall()

    cursor.close()
    database.close()

    output = ""

    for message in messages:
        output += f"<p>{message[0]}</p>"
        
    return f"""
        <form method="POST">
            <input name="message" required>
            <button>Save</button>
        </form>

        <div>
            {output}
        </div>
    """
    
if __name__ == "__main__":  
    app.run(host="0.0.0.0", port=5000, debug=True)