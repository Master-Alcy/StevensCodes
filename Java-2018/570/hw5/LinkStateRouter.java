////final hw submit this

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class LinkStateRouter {

	static class LinkStatePackage {
		private String originId;
		private int seqNum;
		private int ttl;
		private Map<String, Map<String, Integer>> network;
		private List<String> receiver;

		public LinkStatePackage(String originId, int seqNum, Map<String, Map<String, Integer>> network,
				List<String> receiver) {
			this.originId = originId;
			this.seqNum = seqNum;
			this.network = network;
			this.ttl = 10;
			this.receiver = receiver;
		}

		public void handled() {
			ttl--;
		}
	}

	private static Map<String, Router> network = new HashMap<>();

	public static void addRouter(String routerId, String routerName, Map<String, Integer> connections) {
		network.put(routerId, new Router(routerId, routerName, connections));
	}

	private static Router getRouter(String routerId) {
		Router router = network.get(routerId);
		return router;
	}

	public static void shutdown(String routerId) {
		Router router = getRouter(routerId);
		router.shutDown();
		System.out.println("Router " + routerId + " has been Shut Down.");
		network.put(routerId, router);
	}

	public static void startup(String routerId) {
		Router router = getRouter(routerId);
		router.startUp();
		System.out.println("Router " + routerId + " has been Start up.");
		network.put(routerId, router);
		runTick();
	}

	public static void runTick() {
		for (String routerId : network.keySet()) {
			LinkStatePackage lsp = getRouter(routerId).originatePacket();
			forward(lsp);
		}
	}

	private static void forward(LinkStatePackage lsp) {
		if (lsp == null)
			return;

		for (String routerId : lsp.receiver) {
			Router router = getRouter(routerId);
			LinkStatePackage newLSP = router.receivePacket(lsp);
			network.put(routerId, router);
			forward(newLSP);
		}
	}

	public static void print(String routerId) {
		Router router = getRouter(routerId);

		if (router == null) {
			System.out.println("Invalid router ID. Please Try Again.");
			return;
		}

		router.print();
	}

	static void menu(String input) {

		String[] args = input.trim().split(" ");

		String cmd = args[0].toUpperCase();

		if (cmd.equals("C")) {
			runTick();
		} else if (cmd.equals("Q")) {
			System.exit(0);
		} else if (cmd.equals("P")) {
			if (args.length <= 1) {
				System.out.println("\"P\" should followed by the router's id number");
				return;
			}
			print(args[1]);
		} else if (cmd.equals("S")) {
			if (args.length <= 1) {
				System.out.println("\"S\" should followed by the router's id number");
				return;
			}
			shutdown(args[1]);
			runTick();
			runTick();
		} else if (cmd.equals("T")) {
			if (args.length <= 1) {
				System.out.println("\"T\" should followed by the router's id number");
				return;
			}
			startup(args[1]);
		} else {
			System.out.println("Invalid Command! C/Q/P/S/T is valid!");
		}
	}

	static void readFile(String fileName) throws FileNotFoundException {

		Scanner sc = new Scanner(new File(fileName));
		String s = null;

		HashMap<String, Integer> connections = new HashMap<>();
		String routerId = null;
		String routerName = null;

		while (sc.hasNextLine()) {

			s = sc.nextLine();
			// System.out.println("=========> Read from file:" + s);

			String firstString = s.substring(0, 1);
			if (firstString.equals(" ")) {
				String[] rets = s.split(" ");

				int cost = 1;
				if (rets.length > 1) {
					cost = Integer.valueOf(rets[1]);
				}

				connections.put(rets[1], cost);
			} else {
				if (routerId != null) {
					addRouter(routerId, routerName, connections);
					connections = new HashMap<>();
				}

				String[] rets = s.split(" ");

				routerId = rets[0];
				routerName = rets[1];

				// System.out.println("=========> readFile " + routerId);
			}
		}

		if (routerId != null) {
			addRouter(routerId, routerName, connections);
			connections = new HashMap<>();
		}
		sc.close();

		// System.out.println("=========> read end");

		runTick();
	}

	public static void main(String[] args) throws IOException {

		readFile("infile.dat");

		Scanner input = new Scanner(System.in);

		System.out.println("Network started. Please enter Command (ex: 'P 0', 'S 1')!");

		while (true) {
			System.out.print("enter C to continue, 'Q' to quit, 'P' to print, 'S' to shut down, 'T' to start\n:");

			String buffer = input.nextLine();
			menu(buffer);
		}
	}

	static class Router {

		public boolean started = true;

		private String id = "";
		private String name = "";

		private Map<String, Integer> connections = new HashMap<>();
		private Map<String, Integer> tickRouterMap = new HashMap<>();
		private Map<String, String> routingTable = new HashMap<>();

		private Map<String, Map<String, Integer>> networkMap = new HashMap<>();

		private int seqNum;
		private Map<String, Integer> seqNumMap;

		public Router(String id, String name, Map<String, Integer> connections) {
			this.started = true;
			this.id = id;
			this.name = name;
			this.seqNum = 0;

			this.connections = connections;

			for (String routerId : connections.keySet()) {
				tickRouterMap.put(routerId, 0);
				if (!routerId.equals(id)) {
					Map<String, Integer> networkCost = new HashMap<>();
					networkCost.put(id, connections.get(routerId));
					networkMap.put(routerId, networkCost);
				}
			}

			networkMap.put(id, connections);
			seqNumMap = new HashMap<>();
		}

		public void print() {

			if (!started) {
				System.out.println("Router has been shut down. Please Try Again.");
				return;
			}
			System.out.println("The routing table for " + id + " is:");

			for (String r : routingTable.keySet()) {
				System.out.println(network.get(r).name + ", " + routingTable.get(r));
			}
		}

		public void shutDown() {
			started = false;
		}

		public void startUp() {
			for (String router : tickRouterMap.keySet()) {
				tickRouterMap.put(router, 0);
				Map<String, Integer> costs = networkMap.get(router);
				
				if (costs != null) {
					for (String routerB : costs.keySet()) {
						if (routerB.equals(id)) {
							costs.put(routerB, 0);
						}
					}
				}
			}
			
			started = true;
		}

		public LinkStatePackage receivePacket(LinkStatePackage lsp) {

			if (!started)
				return null;

			String originId = lsp.originId;

			if (originId.equals(id))
				return null;

			tickRouterMap.put(originId, 0);

			int packetSeqNum = lsp.seqNum;

			if (seqNumMap.get(originId) != null && seqNumMap.get(originId) >= packetSeqNum) {
				return null;
			}

			seqNumMap.put(originId, packetSeqNum);

			lsp.handled();

			updateCost(lsp.network);
			genRoutingTable();

			if (lsp.ttl <= 0)
				return null;

			lsp.receiver = genReceivers();
			return lsp;
		}

		private void updateCost(Map<String, Map<String, Integer>> network) {

			for (String routerA : network.keySet()) {
				Map<String, Integer> costs = new HashMap<>();
				if (networkMap.containsKey(routerA)) {
					costs = networkMap.get(routerA);
				}
				costs.put(routerA, 0);
				networkMap.put(routerA, costs);

				Map<String, Integer> networkCostAMap = network.get(routerA);
				for (String routerB : networkCostAMap.keySet()) {
					costs = networkMap.get(routerA);
					if (!routerB.equals(id) || networkCostAMap.get(routerB) != null) {
						costs.put(routerB, networkCostAMap.get(routerB));
					}
					networkMap.put(routerA, costs);
				}
			}
		}

		private ArrayList<String> genReceivers() {

			ArrayList<String> receivers = new ArrayList<>();

			Map<String, Integer> map = networkMap.get(id);
			for (String router : map.keySet()) {
				receivers.add(router);
			}

			return receivers;
		}

		private Map<String, Integer> genDisMap() {
			Map<String, Integer> disMap = new HashMap<>();
			Map<String, Integer> map = networkMap.get(id);
			for (String routerId : map.keySet()) {
				if (map.get(routerId) != null) {
					disMap.put(routerId, map.get(routerId));
				}
			}

			return disMap;
		}

		private Map<String, List<String>> genPathMap() {
			Map<String, List<String>> pathMap = new HashMap<>();

			Map<String, Integer> map = networkMap.get(id);
			for (String routerId : map.keySet()) {
				if (map.get(routerId) != null) {
					List<String> path = new ArrayList<>();
					path.add(routerId);
					pathMap.put(routerId, path);
				}
			}

			return pathMap;
		}

		private String findNearest(Map<String, Integer> distanceMap, Set<String> filter) {
			String nearest = null;
			Integer nearestDistance = null;

			for (String router : distanceMap.keySet()) {
				if (!filter.contains(router) || distanceMap.get(router) == null)
					continue;
				Integer d = distanceMap.get(router);
				if (nearestDistance == null || nearestDistance > d) {
					nearestDistance = d;
					nearest = router;
				}
			}

			return nearest;
		}

		private void updateDistanceMap(String curRouter, Map<String, List<String>> pathMap,
				Map<String, Integer> distanceMap) {

			int distanceTo = distanceMap.get(curRouter);
			List<String> pathTo = pathMap.get(curRouter);
			Map<String, Integer> subDisMap = networkMap.get(curRouter);

			for (String router : subDisMap.keySet()) {
				if (subDisMap.get(router) == null)
					continue;
				Integer curDis = distanceMap.get(router);
				Integer newDis = distanceTo + subDisMap.get(router);
				if (curDis == null || curDis > newDis) {
					distanceMap.put(router, newDis);
					List<String> newPath = new ArrayList<>(pathTo);
					newPath.add(router);
					pathMap.put(router, newPath);
				}
			}
		}

		private void genRoutingTable() {

			HashSet<String> allRouterSet = new HashSet<>(networkMap.keySet());
			allRouterSet.remove(id);

			Map<String, Integer> distance = genDisMap();
			Map<String, List<String>> pathMap = genPathMap();

			while (!allRouterSet.isEmpty()) {

				String nearest = findNearest(distance, allRouterSet);

				if (nearest == null) {
					break;
				}

				allRouterSet.remove(nearest);

				updateDistanceMap(nearest, pathMap, distance);
			}

			routingTable = new HashMap<>();
			for (String router : pathMap.keySet()) {
				routingTable.put(router, pathMap.get(router).get(0));
			}
		}

		private void countTicks() {
			for (String routerId : connections.keySet()) {
				if (routerId.equals(id)) {
					continue;
				}

				int ticks = tickRouterMap.get(routerId) + 1;
				tickRouterMap.put(routerId, ticks);
				if (ticks >= 2) {
					Map<String, Integer> stopedRouterCost = networkMap.get(routerId);
					stopedRouterCost.put(routerId, null);
					for (String routerIdA : stopedRouterCost.keySet()) {
						Map<String, Integer> networkCost = networkMap.get(routerIdA);
						networkCost.put(routerId, null);
					}
				}
			}
		}

		private LinkStatePackage generatePacket() {
			seqNum++;
			List<String> receivers = genReceivers();
			return new LinkStatePackage(id, seqNum, networkMap, receivers);
		}

		public LinkStatePackage originatePacket() {

			if (!started)
				return null;

			countTicks();
			LinkStatePackage lsp = generatePacket();
			genRoutingTable();

			String des = "";
			for (String routerA : lsp.network.keySet()) {
				Map<String, Integer> costs = lsp.network.get(routerA);

				if (costs != null) {
					for (String routerB : costs.keySet()) {
						des = des + " " + routerA + "->" + routerB + "=" + costs.get(routerB);
					}
				}
			}

//			System.out.println(
//					"LinkStateRouter.Router.originatePacket() lsp from " + id + " seq " + lsp.seqNum + " " + des);

			return lsp;
		}
	}
}
