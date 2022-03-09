import "./styles/App.scss";
import "./styles/Login.scss";
import "./styles/Button.scss";
import "./styles/Utils.scss";
import "./styles/Input.scss";
import "./styles/Card.scss";
import "./styles/Colors.scss";
// import Button from "./components/Button";
// import Card from "./components/Card";

import Login from "./pages/Login";
function App() {
  return (
    <div className="App">
      <Login />
    </div>
    // <div className="App">
    //   <h1>H1 Lorem ipsum </h1>
    //   <h2>H2 Lorem ipsum </h2>
    //   <h3>H3 Lorem ipsum </h3>
    //   <h4>H4 Lorem ipsum </h4>
    //   <span>Span Lorem ipsum</span>
    //   <div className="medium-separator"></div>
    //   <input className="input" />
    //   <div className="medium-separator"></div>
    //   <input className="input rounded" />
    //   <div className="medium-separator"></div>
    //   <Button color="secondary" rounded={true}>
    //     BUTTON 1
    //   </Button>
    //   <div className="medium-separator"></div>
    //   <Button color="secondary" rounded={false}>
    //     BUTTON 2
    //   </Button>
    //   <div className="medium-separator"></div>
    //   <Button color="main" rounded={true}>
    //     BUTTON 3
    //   </Button>
    //   <div className="medium-separator"></div>
    //   <Button color="main" rounded={false}>
    //     BUTTON 4
    //   </Button>
    //   <div className="medium-separator"></div>
    //   <div className="row-display">
    //     <div className="small-right-margin">
    //       <Card></Card>
    //     </div>
    //     <div className="small-right-margin">
    //       <Card></Card>
    //     </div>
    //     <div className="small-right-margin">
    //       <Card></Card>
    //     </div>
    //   </div>
    //   <div className="medium-separator"></div>
    //   <div className="row-display">
    //     <div className="small-right-margin">
    //       <Card></Card>
    //     </div>
    //     <div className="small-right-margin">
    //       <Card></Card>
    //     </div>
    //     <div className="small-right-margin">
    //       <Card></Card>
    //     </div>
    //   </div>
    // </div>
  );
}

export default App;
