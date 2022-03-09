import Card from "../components/Card";

const Dashboard = () => {
  return (
    <div className="dashboard-body">
      <h1>Dashboard</h1>
      <div className="row-display">
        <Card></Card>
        <div className="small-right-margin"></div>
        <Card></Card>
      </div>
      <div className="small-separator"></div>
      <div className="row-display">
        <Card></Card>
        <div className="small-right-margin"></div>
        <Card></Card>
      </div>
      <div className="small-separator"></div>
      <div className="row-display">
        <Card></Card>
        <div className="small-right-margin"></div>
        <Card></Card>
      </div>
    </div>
  );
};

export default Dashboard;
