class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://download.clojure.org/install/clojure-tools-1.10.1.524.tar.gz"
  sha256 "534e2b9ff28749cdec29e1fd3008f41f3c4f92a867b488fc196002c51cad06aa"

  devel do
    url "https://download.clojure.org/install/clojure-tools-1.10.1.528.tar.gz"
    sha256 "dd7473f0defd07228e5e97b1e0f96b0ad8a8341f7a796705c86632fb7dcb7358"
    version "1.10.1.528"
  end

  bottle :unneeded

  depends_on "rlwrap"

  uses_from_macos "ruby" => :build

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -e \"(+ 1 1)\"").strip
    end
  end
end
