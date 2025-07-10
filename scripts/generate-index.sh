#!/bin/bash
# This script generates an index.html file to display markdown files.

set -e # Exit immediately if a command exits with a non-zero status.

OUTPUT_FILE="index.html"

# Start writing the HTML header
cat > "$OUTPUT_FILE" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Prompts Collection</title>
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/dompurify/dist/purify.min.js"></script>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            margin: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        #sidebar {
            width: 300px;
            min-width: 200px;
            background-color: #f6f8fa;
            border-right: 1px solid #eaecef;
            padding: 20px;
            overflow-y: auto;
            box-sizing: border-box;
            resize: horizontal;
        }
        #sidebar h1 {
            margin-top: 0;
            font-size: 1.5em;
        }
        #sidebar ul {
            list-style: none;
            padding-left: 15px;
            margin: 0;
        }
        #sidebar > div > ul {
            padding-left: 0;
        }
        #sidebar li {
            margin-bottom: 5px;
        }
        #sidebar a {
            text-decoration: none;
            color: #0366d6;
            font-size: 0.95em;
            display: block;
            padding: 5px;
            border-radius: 5px;
            word-break: break-word;
        }
        #sidebar a:hover, #sidebar a.active {
            background-color: #e1e4e8;
        }
        #sidebar .folder {
            font-weight: bold;
            margin-top: 10px;
            cursor: pointer;
            padding: 5px;
        }
        #content {
            flex-grow: 1;
            padding: 40px;
            overflow-y: auto;
            box-sizing: border-box;
        }
        /* Markdown content styling */
        #content img { max-width: 100%; }
        #content h1, #content h2, #content h3 { border-bottom: 1px solid #eaecef; padding-bottom: .3em; }
        #content code { background-color: rgba(27,31,35,.05); border-radius: 3px; padding: .2em .4em; font-family: "SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace; }
        #content pre { background-color: #f6f8fa; border-radius: 3px; padding: 16px; overflow: auto; }
        #content pre code { background-color: transparent; padding: 0; }
        #content blockquote { border-left: .25em solid #dfe2e5; padding: 0 1em; color: #6a737d; }
    </style>
</head>
<body>
    <div id="sidebar">
        <h1>Prompts</h1>
        <div id="file-tree"></div>
    </div>
    <div id="content">
        <h2>Welcome!</h2>
        <p>Select a file from the sidebar to view its content.</p>
    </div>

    <script>
        const files = [
EOF

# Find all .md files, ignoring special ones, and format them for the JS array
find . -name "*.md" | grep -vE '^\./\.github/|^\./README\.md' | sed 's/^\.\///' | sort | sed 's/^/"/' | sed 's/$/"/' | paste -sd, - >> "$OUTPUT_FILE"

# Finish writing the HTML file
cat >> "$OUTPUT_FILE" <<'EOF'
        ];

        const fileTreeContainer = document.getElementById('file-tree');
        const contentDiv = document.getElementById('content');
        const navLinks = [];

        function renderMarkdown(markdown) {
            const dirtyHtml = marked.parse(markdown);
            return DOMPurify.sanitize(dirtyHtml);
        }

        async function loadFile(path, linkElement) {
            try {
                const response = await fetch(path);
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                const text = await response.text();
                contentDiv.innerHTML = renderMarkdown(text);
                
                navLinks.forEach(link => link.classList.remove('active'));
                if (linkElement) {
                    linkElement.classList.add('active');
                }
                window.location.hash = path;

            } catch (error) {
                contentDiv.innerHTML = `<p>Error loading file: ${path}. ${error.message}</p>`;
            }
        }

        function buildFileTree(paths) {
            const tree = {};
            paths.forEach(path => {
                let currentLevel = tree;
                const parts = path.split('/');
                parts.forEach((part, index) => {
                    if (!currentLevel[part]) {
                        if (index === parts.length - 1) {
                            currentLevel[part] = path; // It's a file
                        } else {
                            currentLevel[part] = {}; // It's a directory
                        }
                    }
                    currentLevel = currentLevel[part];
                });
            });
            return tree;
        }

        function createHtmlList(tree) {
            const ul = document.createElement('ul');
            Object.keys(tree).sort().forEach(key => {
                const li = document.createElement('li');
                const item = tree[key];
                if (typeof item === 'string') { // File
                    const link = document.createElement('a');
                    link.href = `#${item}`;
                    link.textContent = key.replace('.md', '');
                    link.addEventListener('click', (e) => {
                        e.preventDefault();
                        loadFile(item, link);
                    });
                    li.appendChild(link);
                    navLinks.push(link);
                } else { // Directory
                    const folderDiv = document.createElement('div');
                    folderDiv.textContent = key;
                    folderDiv.classList.add('folder');
                    li.appendChild(folderDiv);
                    
                    const subUl = createHtmlList(item);
                    subUl.style.display = 'block';
                    li.appendChild(subUl);
                    
                    folderDiv.addEventListener('click', () => {
                        subUl.style.display = subUl.style.display === 'none' ? 'block' : 'none';
                    });
                }
                ul.appendChild(li);
            });
            return ul;
        }

        const fileTree = buildFileTree(files);
        const htmlList = createHtmlList(fileTree);
        fileTreeContainer.appendChild(htmlList);

        document.addEventListener('DOMContentLoaded', () => {
            const pathFromHash = window.location.hash.substring(1);
            if (pathFromHash && files.includes(pathFromHash)) {
                const linkToLoad = navLinks.find(a => a.href.endsWith(`#${pathFromHash}`));
                if (linkToLoad) {
                    loadFile(pathFromHash, linkToLoad);
                }
            }
        });
    </script>
</body>
</html>
EOF

echo "index.html generated successfully."
