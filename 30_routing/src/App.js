import { BrowserRouter, Routes, Route } from 'react-router-dom';
import MainPage from './pages/MainPage';
import NotFound from './pages/NotFound';
import ProductPage from './pages/ProductPage';
import Header from './components/Header';
import ProductDetail from './pages/ProductDetail';
import Photos from './pages/Photos';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Header />
        <Routes>
          <Route path="/" element={<MainPage />} />
          <Route path="/products" element={<ProductPage />} />
          <Route path="/products/:productId" element={<ProductDetail />} />
          <Route path="/photos" element={<Photos />} />
          <Route path="*" element={<NotFound />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
