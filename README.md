# Link Segregation through gf

GF Segration is a simple yet powerful tool for bug bounty hunters and penetration testers.  
It automatically segregates URLs from a list into separate files based on `gf` templates, making reconnaissance and vulnerability hunting faster and more organized.

---

## Features

- Automatically filters URLs by GF templates (XSS, SQLi, LFI, RCE, etc.)
- Outputs categorized URL files like `xss_urls.txt`, `sqli_urls.txt`, etc.
- Works with all your custom GF JSON templates
- Easy to use, lightweight, and fully automated

---

## Requirements

- `bash`
- [gf](https://github.com/tomnomnom/gf)
- A list of URLs to analyze

---

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/GF-Sorter.git
cd GF-Sorter
```

2. Make the script executable:
```bash
chmod +x gfsegregation.sh
```
3. Ensure your GF templates are in ~/.gf/ or the folder specified in the script.
```bash
./gfsegregation.sh -f urls.txt
```
-f urls.txt : Path to your URL list file

The script will create a folder gf-output/ in the same directory and save segregated URL files inside it.
