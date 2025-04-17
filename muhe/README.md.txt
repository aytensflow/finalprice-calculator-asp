<p align="center">
  <img src="logo.png" alt="Final Price Calculator Logo" width="200"/>
</p>

# Final Price Calculator (ASP)

A classic ASP web application to calculate the final price of clothing items after applying an interest rate with annual interest(6-12months selections only)

## 💡 Features


- Add new clothing items with name, type, and price.
- View all saved entries.
- Automatically calculate final prices with discount.
- Edit or delete existing records.
- Uses a Microsoft Access `.MDB` database.


## 💡 ScreenShots
### After Submission
![After Submission](ScreenShots/AfterSubmission.png)

### Index Page
![Index Page](ScreenShots/IndexPage.png)



## ⚙️ Tech Stack

- HTML / CSS
- Classic ASP (VBScript)
- Microsoft Access (.MDB database)

## 🛠 How to Run

1. Clone this repository or download the ZIP.
2. Place the folder on a local IIS server with Classic ASP enabled.
3. Make sure the `clothing.MDB` file is in the correct directory.
4. Access `index.html` from your browser via `http://localhost/your-folder-name/index.html`.

## 📂 File Structure

Final-Price-Calculator-ASP/
│
├── index.html          # Main form
├── insert.asp          # Insert data into DB
├── calculate.asp       # Calculate final price
├── collectdata.asp     # View all data
├── delete_entry.asp    # Delete an item
├── update_form.asp     # Update item form
├── clothing.MDB        # Access database
├── style.css           # Styling
└── README.md           # Project description



