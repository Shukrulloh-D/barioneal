import Header from 'widgets/Header/Header';
import Hero from 'widgets/Hero/Hero';
import Wedding from 'widgets/Wedding/Wedding';
import Sustainability from 'widgets/Sustainability/Sustainability';
import About from 'widgets/About/About';
import OurJewelry from 'widgets/OurJewelry/OurJewelry';
import CustomDesign from 'widgets/CustomDesign/CustomDesign';
import LoveInAllWays from 'widgets/LoveInAllWays/LoveInAllWays';
import Footer from 'widgets/Footer/Footer';

function App() { 
  return (
    <>
      <Header />
      <main>
        <Hero />
        <Wedding />
        <Sustainability />
        <About />
        <OurJewelry />
        <CustomDesign />
        <LoveInAllWays />
      </main>
      <Footer />
    </>
  );
}

export default App;