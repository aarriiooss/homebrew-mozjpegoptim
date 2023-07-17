class Mozjpegoptim < Formula
  desc "jpegoptim compiled with mozjpeg for better quality"
  homepage "https://github.com/tjko/jpegoptim"
  url "https://github.com/tjko/jpegoptim/archive/v1.5.4.tar.gz"
  sha256 "8fc7537f722d533ea8b45966ab80c83e3342d088d5a690fdadfb05b7c9cba47f"
  
  conflicts_with "jpegoptim", :because => "jpegoptim also has a jpegoptim binary"

  depends_on "mozjpeg"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "CPPFLAGS=-I/usr/local/opt/mozjpeg/include",
                          "LDFLAGS=-L/usr/local/opt/mozjpeg/lib",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make"
    system "make install" # if this fails, try separate make/make install steps
    mv "#{bin}/jpegoptim", "#{bin}/mozjpegoptim"
  end

  test do
    system "true"
  end
end
