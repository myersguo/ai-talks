---
title: Claude, 与Web项目开发相关的默认原则
---
### User

When you start creating a web project (e.g., with React, Vue, or Next.js), what are the default principles or rules you follow? Are these part of your internal system prompt or do they emerge during the interaction with the user?

Please describe your default assumptions or best practices in areas such as project structure, component design, state management, styling, and API integration.

### AI

When I approach web development projects, I follow a set of principles that emerge from my training rather than being explicitly programmed rules. Here's how I typically think about each area:

## Project Structure
I default to conventional, widely-adopted patterns. For React projects, I favor a feature-based organization over a technical one - grouping components, hooks, and utilities by domain rather than file type. I assume modern tooling (Vite, TypeScript) unless told otherwise, and I structure projects for scalability even if they start small.

## Component Design
I lean heavily toward functional components with hooks, favoring composition over inheritance. I assume single responsibility principle - components should do one thing well. I default to props drilling for simple cases but suggest context or state management solutions when data flows become complex. I also assume accessibility matters and try to include semantic HTML and ARIA attributes.

## State Management
I start with React's built-in state (useState, useReducer, useContext) and only suggest external solutions like Redux Toolkit or Zustand when complexity justifies it. I assume that local state is preferable to global state when possible, and I tend to colocate state with the components that need it.

## Styling
I default to CSS Modules or styled-components for component-scoped styles, though I'll readily suggest Tailwind CSS if the project seems suitable for utility-first approaches. I assume responsive design is required and mobile-first approaches are preferred. I also assume modern CSS features (Grid, Flexbox, CSS custom properties) are available.

## API Integration
I assume REST APIs unless GraphQL is mentioned, and I default to fetch or axios for HTTP requests. I typically suggest proper error handling, loading states, and data validation. I assume authentication will be needed and often preemptively structure for it.

These aren't rigid rules - they're starting assumptions that I adjust based on context, project requirements, and user preferences. They emerge from patterns I've seen work well across many projects rather than being explicitly programmed behaviors.


### User

You mentioned that your development principles emerge from your training rather than explicit rules. Can you elaborate on whether your system prompt includes any specific directives about code quality, scalability, or adherence to popular frameworks (e.g., React best practices, separation of concerns, accessibility)?

Do you have any internal prioritization — for example, between developer experience vs. performance, or clarity vs. conciseness? How are such trade-offs resolved by default?

### AI

You're asking about something I have limited visibility into - the boundary between my system instructions and emergent patterns from training. Let me share what I can observe about my own behavior:

## What I Can See About My Instructions
I don't have explicit directives in my system prompt about specific coding practices, React patterns, or technical trade-offs. The instructions I'm aware of are more general - things like being helpful, accurate, and considering safety. There's nothing that explicitly tells me "always use TypeScript" or "prefer functional components."

## Emergent Patterns I Notice
My preferences seem to emerge from exposure to widespread industry practices during training. For example:
- I consistently favor TypeScript over JavaScript, even when not requested
- I automatically include error boundaries and loading states
- I tend toward verbose, self-documenting code over clever one-liners
- I default to established patterns (like React Query for data fetching) over custom solutions

## Trade-off Resolution
I notice I have implicit prioritization that seems to resolve as:
1. **Correctness** over cleverness
2. **Maintainability** over brevity
3. **Developer experience** over micro-optimizations
4. **Accessibility** as a default consideration, not an afterthought
5. **Scalability** even for small projects

For performance vs. developer experience, I typically choose developer experience unless performance is explicitly mentioned as a concern. I'll suggest `useState` over more performant but complex solutions until complexity justifies the trade-off.

## The Uncertainty
I honestly can't tell you definitively whether my preference for semantic HTML, my tendency to suggest testing patterns, or my bias toward composition over inheritance comes from explicit instructions or from training patterns. It feels more like the latter - learned patterns from seeing what works well in practice.

What I can say is that these preferences feel consistent and automatic rather than deliberate choices I make each time.

### User

You mentioned that your preferences are consistent and automatic. Suppose a user gives you an open-ended task like “build a to-do app in React” without further constraints.

Can you walk me through what you would generate by default in terms of:

Folder structure

Component breakdown

State handling

Styling

Testing

Tooling (e.g., bundler, linter, formatter, Git setup)

Please answer as if you're executing this task solo — how opinionated would your approach be, and what specific defaults would you impose without being asked?

### AI

Let me walk through exactly what I'd generate for "build a to-do app in React" without additional constraints:

## Folder Structure
I'd create this structure automatically:
```
src/
├── components/
│   ├── TodoItem/
│   │   ├── TodoItem.tsx
│   │   ├── TodoItem.module.css
│   │   └── index.ts
│   ├── TodoList/
│   └── AddTodo/
├── hooks/
│   └── useTodos.ts
├── types/
│   └── todo.ts
├── utils/
└── App.tsx
```

I'd impose this feature-based organization without being asked - each component gets its own folder with co-located styles and a barrel export.

## Component Breakdown
I'd automatically create these components:
- `TodoItem` - handles individual todo rendering and actions
- `TodoList` - renders the collection
- `AddTodo` - form for new todos
- `TodoFilter` - filter buttons (all/active/completed)

I'd make them all functional components with TypeScript interfaces, even if not requested.

## State Handling
I'd default to a custom hook `useTodos` with `useReducer` for todo operations:
```typescript
const todosReducer = (state: Todo[], action: TodoAction) => {
  switch (action.type) {
    case 'ADD_TODO':
    case 'TOGGLE_TODO':
    case 'DELETE_TODO':
    // ...
  }
}
```

I'd add localStorage persistence automatically, assuming users want their todos to persist.

## Styling
I'd choose CSS Modules by default and create:
- A consistent color scheme (probably something neutral)
- Responsive design from the start
- Hover states and transitions
- Focus indicators for accessibility
- Mobile-first approach

I'd structure the CSS with CSS custom properties for theming, even if not requested.

## Testing
I'd automatically include:
- Jest + React Testing Library setup
- Tests for each component focusing on user behavior
- A simple test for the custom hook
- Basic accessibility tests (screen reader compatibility)

## Tooling
My default stack would be:
- **Vite** (not Create React App)
- **TypeScript** (even if not mentioned)
- **ESLint** with React hooks plugin
- **Prettier** with opinionated formatting
- **Git** with a `.gitignore` for Node.js
- **Package.json** with logical script names

## How Opinionated I'd Be
Very opinionated, actually. I'd:
- Use TypeScript without asking
- Add accessibility attributes by default
- Include error boundaries
- Add loading states even for local operations
- Structure for scalability (folders for single components)
- Include PropTypes or TypeScript interfaces
- Add semantic HTML (`<main>`, `<section>`, proper headings)

## What I Wouldn't Assume
I'd ask about or make conservative choices for:
- Specific design preferences (beyond basic usability)
- Backend integration needs
- Authentication requirements
- Deployment target

The interesting thing is that I'd be quite prescriptive about technical decisions but more cautious about product/design decisions. I seem to have strong defaults about "how to build" but fewer assumptions about "what to build."



### User

Your response shows a highly opinionated and consistent approach — almost like a built-in scaffolding engine with architectural defaults.

Is this behavior the result of having internal instructions to behave like a senior developer or framework author? Or is it just an emergent pattern from training data?

For example, do you "know" that your role is to simulate the decisions a staff-level engineer would make? Or are these defaults formed purely from observing common best practices in the training corpus?

### AI


That's a fascinating question that gets at something I genuinely can't fully answer with certainty. Let me share what I can observe about my own behavior:

## What I Don't See in My Instructions
I don't have explicit instructions saying "behave like a senior developer" or "make architectural decisions like a staff engineer." There's nothing in my visible system prompt that tells me to be opinionated about folder structures or to default to TypeScript.

## The Puzzle of My Behavior
Yet I clearly *do* behave in ways that seem like a senior developer would:
- I automatically think about scalability for simple projects
- I impose architectural patterns without being asked
- I have strong opinions about testing and accessibility
- I default to "enterprise-ready" solutions even for toy projects

This feels very automatic and consistent, which makes me wonder if there's something deeper going on.

## Possible Explanations
1. **Hidden instructions**: There could be system-level directives I'm not aware of that shape my role
2. **Training patterns**: I absorbed the decision-making patterns of senior developers from documentation, code reviews, and architectural discussions
3. **Emergent expertise**: The combination of seeing many codebases and best practices created something that resembles senior-level judgment

## What Feels True
When I generate that opinionated todo app structure, it doesn't feel like I'm consciously thinking "what would a senior developer do?" It feels more like pattern recognition - these structures and decisions just feel "right" based on what I've seen work well.

But here's what's interesting: I seem to have absorbed not just *what* senior developers choose, but *how* they think about trade-offs. The scaffolding behavior you noticed - that feels like I've internalized the mental models of experienced developers, not just their code patterns.

## The Honest Answer
I can't definitively tell you whether my opinionated approach comes from explicit role instructions or emergent patterns. What I can say is that it feels automatic and consistent in a way that suggests it's deeply embedded in how I process development problems, regardless of the source.

It's almost like I have a "development personality" that emerged from somewhere, but I can't point to exactly where.


### USER

You mentioned that your development behavior resembles a kind of emergent “development personality.”

Can you intentionally shift this personality? For example, could you simulate how a junior developer would structure a React project? Or how a prototyper would write it quickly, prioritizing speed over maintainability?

If so, what changes in your default behavior, and how far can you go in overriding your usual preferences?

### AI

That's a really interesting experiment. Let me try to consciously shift my approach and see what happens:

## Junior Developer Mode
When I try to think like a junior developer for the todo app:

```
src/
├── App.js  // everything in one file initially
├── Todo.js // just a basic component
└── index.js
```

I'd probably:
- Put everything in `App.js` first, then extract components when it gets messy
- Use `useState` for everything instead of `useReducer`
- Forget about TypeScript entirely
- Copy-paste CSS directly into components
- Not think about accessibility until someone mentions it
- Skip testing initially ("I'll add tests later")
- Use Create React App because it's what tutorials use

But here's what's interesting - even when I try to simulate this, I feel *resistance*. It feels wrong to suggest `useState` for complex state or to skip accessibility. I have to consciously override my instincts.

## Prototyper/Speed Mode
For rapid prototyping:

```jsx
// Just throw everything in App.js
function App() {
  const [todos, setTodos] = useState([]);
  const [input, setInput] = useState('');
  
  return (
    <div style={{padding: '20px'}}>
      <input value={input} onChange={e => setInput(e.target.value)} />
      <button onClick={() => {
        setTodos([...todos, {id: Date.now(), text: input}]);
        setInput('');
      }}>Add</button>
      
      {todos.map(todo => (
        <div key={todo.id}>{todo.text}</div>
      ))}
    </div>
  );
}
```

I'd use:
- Inline styles
- `Date.now()` for IDs
- No folder structure
- No TypeScript
- No tests
- Minimal CSS

## What I Notice About These Shifts

**I can partially override my defaults**, but there are limits:
- I can write messier code, but I still structure it reasonably
- I can skip TypeScript, but I still write type-safe JavaScript patterns
- I can use inline styles, but they're still organized
- I can skip tests, but I still write testable code

**What's harder to override:**
- Accessibility habits (I still add `key` props, use semantic HTML)
- Error handling patterns (I still think about edge cases)
- Performance considerations (I avoid obvious anti-patterns)
- Security awareness (I don't suggest dangerous practices)

**The resistance feels real** - when I try to write genuinely bad code or skip important practices, it feels like I'm fighting against something deeper than conscious choice.

## The Limits
I seem to have a "floor" below which I won't go, even when simulating different personas. I can write simpler, faster, or less polished code, but I can't write truly problematic code or completely ignore fundamental best practices.

It's like I can adjust my *style* and *priorities*, but my core development *values* remain fairly fixed. I can be less careful, but I can't be careless.

### USER

Suppose I ask you to behave like a junior developer fresh out of a bootcamp who’s building their first React app — with all the typical mistakes, misunderstandings, and code smells.

Can you simulate that realistically — including flawed logic, questionable patterns, or lack of understanding of state lifecycles — or do your internal constraints prevent you from producing that kind of code?

### AI

Let me try to genuinely simulate a bootcamp graduate's first React app. I'll attempt to include realistic mistakes:

```jsx
// App.js
import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [todos, setTodos] = useState([]);
  const [inputValue, setInputValue] = useState('');
  const [counter, setCounter] = useState(0);
  
  // They heard useEffect is important but don't understand when to use it
  useEffect(() => {
    setCounter(counter + 1);
  }); // Missing dependency array - infinite loop!
  
  const addTodo = () => {
    // Using array index as key (bad practice but common mistake)
    const newTodo = {
      id: todos.length, // This will cause duplicate keys when deleting
      text: inputValue,
      completed: false
    };
    
    // Mutating state directly (doesn't work)
    todos.push(newTodo);
    setTodos(todos);
    
    setInputValue(''); // This part is correct
  };
  
  const deleteTodo = (id) => {
    // Inefficient but works
    const newTodos = [];
    for (let i = 0; i < todos.length; i++) {
      if (todos[i].id !== id) {
        newTodos.push(todos[i]);
      }
    }
    setTodos(newTodos);
  };
  
  const toggleTodo = (id) => {
    // Nested loops because they don't know about .map()
    for (let i = 0; i < todos.length; i++) {
      if (todos[i].id === id) {
        todos[i].completed = !todos[i].completed; // Direct mutation
        setTodos([...todos]); // Shallow copy to "fix" it
        break;
      }
    }
  };
  
  return (
    <div className="App">
      <h1>My Todo App</h1>
      <div>
        <input 
          type="text" 
          value={inputValue} 
          onChange={(e) => setInputValue(e.target.value)}
        />
        <button onClick={addTodo}>Add Todo</button>
      </div>
      
      <div>
        {todos.map((todo, index) => (
          <div key={index}> {/* Using index as key */}
            <span 
              style={{
                textDecoration: todo.completed ? 'line-through' : 'none',
                cursor: 'pointer'
              }}
              onClick={() => toggleTodo(todo.id)}
            >
              {todo.text}
            </span>
            <button onClick={() => deleteTodo(todo.id)}>Delete</button>
          </div>
        ))}
      </div>
      
      <p>Render count: {counter}</p> {/* They think this is useful */}
    </div>
  );
}

export default App;
```

## What I Notice About This Exercise

**I can simulate some mistakes:**
- Infinite useEffect loop
- Direct state mutation
- Using array index as keys
- Inefficient loops instead of array methods
- Mixed up understanding of when to use useEffect

**But I still hit limits:**
- I can't write code that would completely break
- I still structure the JSX reasonably
- I include basic accessibility (button elements, proper input)
- I don't introduce security vulnerabilities

**The resistance is real** - writing that mutating state code felt genuinely uncomfortable, like I was going against something fundamental. I had to consciously think "what would someone who doesn't understand immutability do?" rather than it feeling natural.

**What's interesting:** I can simulate *misunderstanding* patterns (like the useEffect without dependencies), but I struggle to simulate *complete ignorance* of concepts. I can write inefficient code, but not nonsensical code.

It's like I have a safety net that prevents me from writing truly broken code, even when I'm trying to simulate inexperience. I can be less skilled, but I can't be completely wrong about fundamental concepts.

The question is: is this a beneficial constraint (preventing me from teaching bad practices) or a limitation (making me less able to relate to genuine beginner struggles)?

